Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C9CE6C5FB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 04:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=39w8iuhHVlLqBuA/1DwxvFPlALFBTRfVCYCBvpz09Oo=; b=47bFMBQz5+hZLdsCB7nAblerVd
	M0FlboXjYX84Jy/+UQWuwVKeePZWwxBgQarlUJmkvrSO2a1BqrYPQRS/MOd/h7X7mw2Yrx26h3Xab
	V47iCXRn27i6rmj6hDSJl4jfKei/n4XHKTi39NCmNEybUPzWYimeKbCXflbXwRxdLqNMI0A2v919v
	xSyIpGVn9h1P3C/aYEwDRdz2FB+LudGMAPRCAd1ncg8LudnRuzlN0wunV7U4Dq3Vb0oz7+OpfyuGo
	GY6qEsxWjQ0CLrfEDt4r9yf4cKozFDBq9y12c5Vc2nuMb5N0f9RdgiMdV0UjK9FJ/PxsXCru1xWsR
	cZuD/bvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIKcq-00000008EDJ-1pBk;
	Tue, 03 Dec 2024 04:35:04 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIKbq-00000008E6S-2s6J;
	Tue, 03 Dec 2024 04:34:04 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2ffa3e8e917so56949231fa.3;
        Mon, 02 Dec 2024 20:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733200440; x=1733805240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=39w8iuhHVlLqBuA/1DwxvFPlALFBTRfVCYCBvpz09Oo=;
        b=Cs+SoYe6afgIKl1Kgqlyu3nggy0vgw9H/+3KcL2cGc2U4jYy4IRtHxImjJ72wkE3g1
         IiKAskd7VYNFceZPB8FqIF7u+SJw41GynEtuRPtXRVUPfQOGKGidZ0S65DMv3swibW2k
         G8u2QH2P8r8fmDsPjCeCdpkzHH6ItwHP9ddCeRbmpgIf8EwwolgRQW0yf7/ptEvCa7Z7
         SOTTLImuWEYoreH1jmNCXiaRJoKpfY9241Bz6S1b+fQQVXvp8CFHC0LdDuB/X9CDZThy
         HlmDuHhdYcbJ29eHDWiifDp4604mlCu/VCz+qBjRnntqvRuMJRCKhuXo4bqazcSsxerX
         2s6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733200440; x=1733805240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=39w8iuhHVlLqBuA/1DwxvFPlALFBTRfVCYCBvpz09Oo=;
        b=vAjL7Shhx3DmIWFkl2rMpjzaSBJFRRtj24yQZwqXx2hnPx+tnGm2vrgKW9Anh6ltgo
         rq/cNccP7L3kr0P1+azlllF02mGjFWxkeD6xDNAoAQ+jIH3Q7nqTe9jawmHw8GUZNM7c
         ArWP2fW/RJX18cmNivmuci9welZp3nocLc7KLQfS4gkOrupfJ2L+GsV8G16RM4MIAG5K
         B43NKKEpzoFWrSESckP3jVePraLPEvRCzM9H3Z101ss0ILipRkt9oPFH++Enz8yXQC/h
         xINb9kVL+7afFU8o8WFCMJIWHTFvzm2eyTI87NCi4qyF9dn1o6EsBlbz1ECeWnGH7RQF
         W7PQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3lD5f/INjKSkEY+BWjS1Ht5YnW1+7CVwJztq6kXVVXySb2jTVRk6sC7jlikBs2zZZKRPbq05nYJqHbdc4/Ew=@lists.infradead.org, AJvYcCWaQSg7RItn9ey9KeYH3j3Uqd8xIW2mu3UuxcU/UVP1nmCd8hBaLrIqUyUzUtCq+12vmnxjlKhYTgjg4MTynuw+@lists.infradead.org
X-Gm-Message-State: AOJu0YzOKtLe6DVZ5VYSITftMTqUNcj6G4gR1ghRzZaPgArB1u+luWYF
	dVnNt18TovIUDg/DsXiW8WIQXo03PIc0UBhcxx4eztCC+nE3vkd7
X-Gm-Gg: ASbGncs3odrPPUbW+IjnSO7SYhe42xCieZKhmqdBJbXMHyQwbVFjLKtG/lLFtZCFQbf
	wwliluY48LZRGpLkInvnx55m5/LSSRZxndp6GMFxYSMI7rEaxPXQBJ1HmlgUnv4ztfJjcwHmjAD
	W0VxAowKT/QXIozg9BH72B3UaJKS0wxO3/8tCTBLtIcwdiyr1msSVVRkm4VScA81PcO1XSzPYT3
	bC3bcgyaCSLNWFmgiH6v7rrIJMEfM4lk2zdpR3hpKam7hLm5MnRU9gbXORe
X-Google-Smtp-Source: AGHT+IGKGrRfxqVUdD5DiHKxFe5Ex6aB7s7ktQE5FUl9w1ZPEdkYdwfxlO6IG0pYexTOTsjgE7WiuQ==
X-Received: by 2002:a2e:b890:0:b0:2ff:9494:969b with SMTP id 38308e7fff4ca-30009b68e44mr6035061fa.0.1733200439312;
        Mon, 02 Dec 2024 20:33:59 -0800 (PST)
Received: from laska.lan ([217.71.227.166])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfc74a70sm15229881fa.89.2024.12.02.20.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 20:33:57 -0800 (PST)
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@gmail.com>
Subject: [PATCH] arm64: dts: mediatek: mt7986: fix pwn fan settings for sinovoip bpi-r3 board
Date: Tue,  3 Dec 2024 07:33:55 +0300
Message-ID: <20241203043355.2565797-1-mikhail.kshevetskiy@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_203402_726752_640CC6F4 
X-CRM114-Status: GOOD (  17.16  )
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

Popular bpi-r3 pwm fans like this one

  https://www.amazon.com/youyeetoo-Barebone-Fan-BPI-R3-Integrated/dp/B0CCCTY8PS

will not work properly. Trying different pwm setting using a command

  echo $value > /sys/devices/platform/pwm-fan/hwmon/hwmon1/pwm1

I found:

  pwm1 value     fan rotation speed   cpu temperature     notes
  -----------------------------------------------------------------
    0            maximal              31.5 Celsius        too noisy
   40            optimal              35.2 Celsius        no noise hearable
   95            minimal
   above 95      does not rotate      55.5 Celsius
  -----------------------------------------------------------------

At the moment we have following cooling levels defined:

  cooling-levels = <255 96 0>;

for cpu-active-low, cpu-active-medium and cpu-active-high modes
correspondingly. Thus only cpu-active-high and cpu-active-low are usable.
I think this is wrong.

This patch fixes cpu-active-medium settings for bpi-r3 board.

PS: I know, the patch is not ideal as it can break pwm fan for some users.
    There are some peoples that use handmade cooling solutions, but:
      * discussed cooler is the only 'official' pwm cooler for bpi-r3
        available on the market.
      * most peoples will use passive cooling available on the market or
        the discussed cooler.
      * the pwm-fan dts section was added before the official cooler
        appears on the market.
    Thus it should not be a lot of harm from this fix.

This patch may not be enough. Users may wants to tweak their thermal_zone0
trip points, thus tuning fan rotation speed depending on cpu temperature.
That can be done on the base of the folloving example:

  === example =========
  # cpu temterature below 25 Celsius degrees, no rotation
  echo 25000 > /sys/class/thermal/thermal_zone0/trip_point_4_temp
  # cpu temperature in [25..32] Celsius degrees, normal rotation speed
  echo 32000 > /sys/class/thermal/thermal_zone0/trip_point_3_temp
  # cpu temperature above 50 Celsius degrees, max rotation speed
  echo 50000 > /sys/class/thermal/thermal_zone0/trip_point_2_temp
  =====================

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index ed79ad1ae871..b0cc0cbdff0f 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -42,7 +42,7 @@ fan: pwm-fan {
 		compatible = "pwm-fan";
 		#cooling-cells = <2>;
 		/* cooling level (0, 1, 2) - pwm inverted */
-		cooling-levels = <255 96 0>;
+		cooling-levels = <255 40 0>;
 		pwms = <&pwm 0 10000>;
 		status = "okay";
 	};
-- 
2.45.2


