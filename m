Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D24CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 16:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F1BUyJVLso5e3sw9oVrEXxJTuPzZqZWk1jkcADSRdMY=; b=0fhCpqRgm0UgbiIxBoB/T1RtmU
	CMdHl32fPEFDcq7gOtsjcDx2u7KSNlzM66C7Hajc6GWo8O5UWV5jr9DQNCP6rmKxu58mSXZGQXEeR
	PVStXf2FWihP8MTfT2d+8sWwc4PYf0atC9JsKbPD2IbJq4LggIYXokMooCYM8po2iBXkKFk8jJVOc
	sh7e62yte3HI/7AEB9PXOj4/C0tOMyXupHMqHBu32rIejkhtEMpSj3ElqAvCucJoerQEFoMbYeOMh
	AxJFSuB1dHYJf2VujnSEIJznssi1Oes5PzuPD9oG0dMWuBWh60kRDZv+Mp7k+8qd2iNv7N7L6gBWL
	cU/6AqtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJJD-0000000GDMi-1Tsl;
	Wed, 27 Aug 2025 16:47:39 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urHEv-0000000FmDl-1qP9;
	Wed, 27 Aug 2025 14:35:06 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3cd59c5a953so272494f8f.0;
        Wed, 27 Aug 2025 07:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756305304; x=1756910104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F1BUyJVLso5e3sw9oVrEXxJTuPzZqZWk1jkcADSRdMY=;
        b=BEQ3GAlg1EkatbT146T+cuIPoFEB2Y3cyzg5OeyS+zQIAIqpPzQ5GYgG61T/h35yIl
         ypt0peXyN0apte80et6DNBywQ+dHHcfMPetq97d4vjZwkIm3dFaP7ooemHPt3iCluNsF
         zw9guvGoXIxdEcp8Ia87F+yvxId18xOYiVL7LN9sQUGACyrT4C6VpvxIsaUzhgECzrJf
         gWZ8UoCRdLLZ7IiAtVvvRRd7vTVCnpu4ApqNx/RptRj7TmLWXxh/DkbiJgCk2Rcpr3zf
         iO6+31wHiRA/0JPenN7Ngz6E8HWOWPvJYyZe83LMUgSckNiYEs6oq92rK3FPyCADrC5N
         6ORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756305304; x=1756910104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1BUyJVLso5e3sw9oVrEXxJTuPzZqZWk1jkcADSRdMY=;
        b=vF0Nj0Ulz3Y3Sd2Y1gmtNIY1ggOl0ukZfhvF2gC8G0fLiseyY+rOYbA3hhmdAKka38
         IH2pvr2pyekcZxfbC65XcSUJj0FyyPY5gPHm2qu8Yyzie1mrA6O6yt/xgq8AGp9NlkFu
         wBeSHyMUfvrjd9aLTWt/z69o4HP87gL3MxvWrNd/FIq4SWwdZoa02SWnp7ykfhSQpaiU
         1j4geIc0Vmdx8mlAMM/iDpq/DlQyBssqlkiwm/9aun4RgeCpLTkom5Pz/ehxkXPkYSOu
         /B+xGwpObrmJbBO4hKRfl1dutpPxo+ulFiZkxvKRNyvIa2be6qm806F1VLyB7+dwthHz
         NG7w==
X-Forwarded-Encrypted: i=1; AJvYcCU90K7rt5C1/GW+KsSLnaCyvQf1TD9ID6j2mJQNaiAhpyaT63AY5kbkBEmRNJXrrcVu+YTDKONt34BRHQEwBuw=@lists.infradead.org, AJvYcCWvhQZpx/F2LQryfDjnvMXOvirxeHkg1QKuSP7W3pO2e635ILRfDIZBO2TwboAxeTFnFWPXPGdZoMk4ZatHvLqZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwHYbwzCByRnZbPAqRRuRd8OXaoMG6GNi/ssbQeWMFBRoJ01Tjv
	oiWjgC5RAc91FOVGL4SWAtLLEUS+blUIUYf0hhUd0EkgqMNIJ6CKnWHw
X-Gm-Gg: ASbGncsZSKm2DiW0qil62ClDmhm/68GjlJ8ZJX0ebbieAwueTpqZEt3XsOe+or4L5Lv
	6Sa7E+fuJCvlHKPMOo06ODSwkDLKzPnrxOJUMSkLtJlYj/kO1VxZEiw3SwWfTnSCxm43XvTQEUr
	usnYCPfJ4nTsKWR2eK5IwkbhpAZv2XPgQV/5PMrHj+j+w/SQnXgnLHs/czDl8LxjQbrjetuv9wF
	XBePUK6LxxnmAJgf0uK5rE+3mpB+YlrxWV+kkCbFHP4/renj7W7dTQDs3qQkrp/LJ6A5zUn0dMe
	63hGrqB9Ud+1t0hPRguttxAP5UWqppM21srPoA31BOB/wfwCiLlEV+rQF1S3AD9QLBq/AfNtKo8
	OvBpjCXtsarVDWJ6P1Iz9KrEfxAY8wWW4XZ5TcthAR/rv+Klo5RdUhXegfZ0dSJryQeiBavIzn+
	ppmGsk/RkcTpwDvZ5e0KYcmkEOjY6r1d3sKG1uJJeW68S+nJal1CnhObA+Xd1/L7E=
X-Google-Smtp-Source: AGHT+IGkKJ1XhDqK4M+m0K4FkEys/uX4rfEbc6c/Gcwva4PyVBgFs99pGKTiljPLXjMWH46PmsM14Q==
X-Received: by 2002:a5d:5d08:0:b0:3c5:20d3:6041 with SMTP id ffacd0b85a97d-3c5dc54071emr16944872f8f.41.1756305303612;
        Wed, 27 Aug 2025 07:35:03 -0700 (PDT)
Received: from cypher.home.roving-it.com (7.9.7.f.b.1.3.0.b.8.f.0.9.e.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:e9:f8b:31b:f797])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c70e4ba046sm22750178f8f.1.2025.08.27.07.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 07:35:03 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Diederik de Haas <didi.debian@cknow.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dragan Simic <dsimic@manjaro.org>,
	Ondrej Jirman <megi@xff.cz>
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Add vcc-supply to SPI flash on Pinephone Pro
Date: Wed, 27 Aug 2025 15:34:58 +0100
Message-ID: <20250827143501.1646163-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_073505_476368_D36C882B 
X-CRM114-Status: GOOD (  11.45  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

As documented in the PinephonePro-Schematic-V1.0-20211127.pdf,
page 11, the SPI Flash's VCC pin is connected to VCC_1V8 power
source. This fixes the following warning:

  spi-nor spi1.0: supply vcc not found, using dummy regulator

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index be90e049a302c..24e4365a2e588 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -772,6 +772,7 @@ flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <10000000>;
+		vcc-supply = <&vcc_1v8>;
 	};
 };
 
-- 
2.51.0


