Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D3B606D806
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 18:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=32wJ99SY;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QCqlPk9d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CC2o7x8TbRQPLTSxucMf934GUQljaJFM5e5gaMCtH14=; b=32wJ99SYW/0im3
	qWL+FctZnrUbu/OxWislnS8p2xQpNb9R0lql5XFnhhPAYi8nG9sJ7XJkba2Xs/CssiGFcE8IJBPbf
	6jZ5hMqQ/3k8yiU7zCWmYcsVW0cSLATYDfVTzBLkuP0VD7xN+X+dcjl+uVR4QRpGcHfmytFbvh7vf
	gYCmuFdRcwHnjlsL2MVrgvyVa0nnIBFxi2L5vUgrOZWbSaf6YCddfODMPT7qtyBdSITIKNdrPLsCh
	dcI1z+ap+lukSsJm3MKXzg8uA+Fwk91UljVasL3EgFz98STlrg89r8J85rLJM2mLRDzpcCVolbk/z
	XGUT69C9CfRWbuf9ei+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxBl-0000000023w-0DYz;
	Mon, 02 Nov 2026 18:55:25 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxBi-0000000022b-2G9S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 18:55:23 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48e04773687so1010307f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 10:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793645721; x=1794250521; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CC2o7x8TbRQPLTSxucMf934GUQljaJFM5e5gaMCtH14=;
        b=QCqlPk9dReLU8JGunlhcY2NfrDD2mSaw92hQt69CsPa+fYQqa1NtWFpGUKyJskZnM8
         n2Blt0caHTlI1yp6V0Tl7lpIGuTI84kiYIlFKbwx/ZjoVyePoZkTlu4QLug5CmHzcodj
         YokO1lmYLmFAOCcNJwTOsJK6wAFOYgCIqRM/agDrTAktX70BUliJsttwy4eQ0MCF5r1E
         9zRO0jTqgHpV13Gxb2ELuk31AHskYMYxV63IDYMeFD/aQI6gnxpGGUfovfp3D9Gh1ik1
         3gHTr/uLu9xLvPUbtFqjmh0UU7W6Wd9rOxKx+FmGS+9MdmbVImbNqA5YmoXSTPz1CxuW
         QV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793645721; x=1794250521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CC2o7x8TbRQPLTSxucMf934GUQljaJFM5e5gaMCtH14=;
        b=C2+DSHR5hjyJFiw3gwCVZL9SKDEbAApufknQ73n8bMOFYBq0X90lq8iLcf/+KsRiPw
         j35F854ZCcaUyh1UInmLZvk8uTJnLIEmOjo43gXahJjolAvdtgdBY8woyjsmHQ9kDHag
         z3TVphAVR70xMqhnN7cQ8r9URCCK+fhQ80bd3tLBufuwiLU3h3gKN4DSnZgJNHSmGZJ0
         6Vst1f4yBB0EgiocHJgHshq+BntkV0dPKMupB0bEJBr1bNuYfpPWIj3pIfaKcLHZvJ9B
         u6qqqndJXur8kIwXXXCUQglkrYdx9V7Z9iZY6Iub8iEOoRQFdoZTXf10uV8JZkWgi/73
         xcIQ==
X-Forwarded-Encrypted: i=1; AKwUvByCxDjjbXiAn2mLYDMWeMIPXe/LVjcRF7TgBRkWlvF9znkZ19ju1GCjNEo+H2bDooAIkXTFT0wGyUiLovegO7Gy@lists.infradead.org
X-Gm-Message-State: APuU4Z9BBcYDv3K2MAgcgzWGwOcot3I3TT0ltvMtM0qsEfO4H5fa4G9K
	WDXoc0bWKy8T2N9Mrv9GLpL93Y4gPb7sjgj4swwKecMv4QYb/vBU9hNr
X-Gm-Gg: AYBFou1XgknrxYIUX+A3hX/cwiGLMpb2qmgDis55S3RbEN1fsOuHY8hRqZ8zix0Ee/g
	PX38rPMVNkle9+07UaOlYiFayCO516pqE3c0eK5nxXLwS+WbxzWemaCQSEFmpsr04ppR/O3Js0+
	oyOd04NXzjCptUGP/G14cTuvscoAScayvJF1mig615DcCIb8TbO+t2cdIQayzQRsAv3wjIDEii4
	LayGX/0+4yJXHmJeZ9KypVHTiELHQcGL1uYSTL3outZSXKfn1nx5nA3c6+wmItD4Mh/0CSmRDZd
	mDaC/Qc08HU3FWUewYVyQ61CzCJHxQzj67RdNJ++jgOQPZpe1VdCBk3T5OCKPWllHyQ+mbv82DV
	CkAALWN+IuLMBEzx3cpwpYUDj0c5gqDtdhWN/Vx8uib0mTatxmP+45yR1qNuP2Ghr0YdkW/kjTL
	Twt2ovJp8TLK2YXrA4yOGmKH8uwIxkx3VCGDdhczyLPPPsxkS4FzzwXStUdBb4IFqEFrVytO5mq
	N5msGT2axKXdz0QcR0OziSc4PDnv4z4uso//Nndzp6BM2mlQFuqX9FXP5Znjz3JR8R+TI1cIccI
	akeBpcFlERlcUmMIvdmehTLah63FRwGRtYLqT/D5DtFNDoNwci/vlIIBzdLh1T04OE8fN7GRY9P
	nPbTMY7qDl/5y/uMhvcXeUP7Cg1hLHs59lL57AvPTAeOd8cp5dWnC
X-Received: by 2002:adf:edcd:0:b0:48b:f08:8159 with SMTP id ffacd0b85a97d-48e6e502fa8mr19192373f8f.40.1793645720777;
        Mon, 02 Nov 2026 10:55:20 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7815fsm21965403f8f.22.2026.11.02.10.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:55:20 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alifer Moraes <alifer.m@variscite.com>
Subject: [PATCH v1 1/2] arm64: dts: imx93-var-dart-sonata: enable UART wakeup
Date: Mon,  2 Nov 2026 19:55:03 +0100
Message-ID: <b51bef917d08b83bd231a4a228fb2d23c19a858b.1793645417.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793645417.git.stefano.r@variscite.com>
References: <cover.1793645417.git.stefano.r@variscite.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_105522_592479_F033BE47 
X-CRM114-Status: GOOD (  11.13  )
X-Spam-Score: -0.8 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the LPUART1 serial console as a wakeup source to allow it to wake
the system from suspend.

Co-developed-by: Alifer Moraes <alifer.m@variscite.com>
Signed-off-by: Alifer Moraes <alifer.m@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
index 1ca3ec8330d0..d368a09dc916 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
@@ -385,6 +385,7 @@ can0: can@0 {
 &lpuart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
+	wakeup-source;
 	status = "okay";
 };
 
-- 
2.47.3


