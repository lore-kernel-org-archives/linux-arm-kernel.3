Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF93606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 03:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PtY9BZuP;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zn0WuywL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cL6Lm2cBZjv9q+hFge8UMv8VlPsyusharMMb4O8VvGE=; b=PtY9BZuPrxzu2S
	h6D6fqvMiG5GDkcc7FKVPYW8bL/HSSb8blJMuoVzK6LXJdiIp7GxpIgov8bN1pdho9GFUU1Aix4Pn
	t5Yt82PvsXzWl4Sk0D+oMdLABNkJXqsYSKdSpGuORvm/ehSxZL5n0F2CNnk1nm7AY2i9Ue+chi+rO
	9u7+r9V1ltnAIt5aGR2cuuGLK2/PZ6Y/NplgX9lhu0fkS/jKoxLVMM+aYf35teG/jnxSCjXEsu6NU
	OGXnelYKbn2gwRgSTRlM6Zp7/gafVQTCvPHT/5TzNZrj58lkaLArJUcayS+Fs/RRV7QOJpcSZ5nyI
	/iVpawmBIAaBis4lbuLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPAEv-0000000B8LH-3JSJ;
	Fri, 06 Nov 2026 03:03:41 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPAEu-0000000B8KA-0E5a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 03:03:41 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so68601a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 19:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793934219; x=1794539019; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cL6Lm2cBZjv9q+hFge8UMv8VlPsyusharMMb4O8VvGE=;
        b=zn0WuywLsd62ubaapjt7Uvb4EydAoqSstLUt+Kj2lYnNf/nP7NuTtCki8pz613Pxhm
         WoCBmvCSVb1Otx/Ij3d5B7eB8rlM4RQsReUbFcZ+26hy+d1ZzyxWcJeTJTw0td1rJDYr
         Q90sGkKr1z9GDz9z26a4NzUJMFsLvzVFFwsRIEmRV55eDs1Wc5SYiCOsbV3ZRXmLfGQa
         srPQozoXj12WPDs7kSs1Rbp2R5/fklI2qeEP/CfykqXeID/Jzb9FZiUML7LKapWE9JYa
         Z4+xT/nFrC+OZx/YJR7GqXIkzSl7OOtEYPm3Ge6exvZsJuZvcezv1rwV1PLxAUi7UprJ
         m13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934219; x=1794539019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cL6Lm2cBZjv9q+hFge8UMv8VlPsyusharMMb4O8VvGE=;
        b=zQhJV1LrBK7zjYIA1KCbjgHiNe130I4/X5xHgB8Yn6ddRKJsDlVdHdSTKFdJ8kdO64
         UqHA9xrrv9Hf/D4pUd77YqES9MJAmzwJC7SgldxIk0R3msgkFUwqKmmLterARCGAL6ag
         V0OHgHhMchX+XvckLFgcDvcufmXErc4NY2g0nsYOb97u4r8sqjBBkV6CXsiMRDZHuW4j
         KbB38dF0KEqAnkbjbKpohBNoM9xTaKkln9DoXxmQXA8c75co7hId4e0ewWOd1204/LhH
         nClIMo3XSS7VnKvYHkiIqOHZx4cPgaFbNCnQf63I99eVuGEQRC/0kEVkXuIpbOkeCxpq
         lLvQ==
X-Forwarded-Encrypted: i=1; AKwUvByhjQ51t0hNiOUJ5IlJJs9cexhz0hpWu+ZnBpxjAyJrLfe1bDKMV3L+CG0JQBEE8Tniwr2SUVL4GQiALK3H9ZFR@lists.infradead.org
X-Gm-Message-State: APuU4Z8EmnXN/9kdb9hRv/AMuzgtKLRic3kds2JXVaYySHnQ6G3XtQdE
	ha/YM1Y1NBX12yJLwRzXQiB1NSot9GpyEN08ikFiB15lo8TXdJa9CnVFGP7Ieg==
X-Gm-Gg: AYBFou0kyucOVrYFGY8Ky80wlY6qd0LY3Q7rQaIHf1NFwdk68VdykRdcOD84JTMlY1w
	TOFLKB+JCus74Z2rqQ40jghODvV75icqPYM6BBVLGEu6hddxP5SOiCfEhEsMOJEoFrEPgdGZFC+
	22Lpl0vej3V+kxdAwTpcfzf0Yzz/o+Pzg/oM351Ka972C/E9ZVbCRfunP1nEhTMzAZJU/L055wF
	GK0Xc0TSBOiDZQ2uQa3fGHKKwM9omc7I945QEl9MDHu5b3PV9ZdZVe563XftAjMqUVm2BdogmQv
	Oq3bh2IMYyW0UZEmMRBunx7Z97z/KTqyu6+deOQFcIYNX5nDLsb5hArtKcquFNOxwtRQJAZXGk4
	+SVUGkwSXSlO8Sp3KTSW31aFHHHGLd7NUA3hzWAaEI2pzNugQyLPT4tTNGbtmg29WfyXHucPRCJ
	R/3NAG3tJ1DhZ1A6VvENPTjVrvCDTgwkYXm2aXkxfo+v8UkdY220ICipjxRxDHHmtnQB8vCd/gk
	JzK1M8yKCT2f+m0jcuvoW9toit8PX0IBtwbvjmG1BJv4iXVfNrlnnJoCrpDW0jsqUuhUjfgB6DI
	K3Q/gBVXHop8c/RqBsVhLeHkWE9Im1aM/Ub/pkZQGySxlZb5YWqF0VpFuwxT0d+S47em
X-Received: by 2002:a05:6300:67c7:b0:3e2:3222:2559 with SMTP id adf61e73a8af0-3ebb2a978f5mr1627729637.62.1793934219096;
        Thu, 05 Nov 2026 19:03:39 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a04a39sm118179a12.15.2026.11.05.19.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:03:37 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Fri, 06 Nov 2026 11:08:02 +0800
Subject: [PATCH 1/3] ARM: dts: aspeed: ventura2: Add LTC2305 ADCs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-ventura2-dts-update-v1-1-b085ece9bf57@gmail.com>
References: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
In-Reply-To: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1757;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=s3+YaNI0kXS1WHGDFc6jVaitSFXgSkUDG8m8Ajnq+tw=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq7USVrNYo936MKfY8QZ8ByY59Ccq89oZ8md29i
 fRH6E9D4z+JATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCau1ElQAKCRClg0K3CVbE
 gQTMCACAEQvBIE/8WEFrZZ9u96QoYyPrhnfijSAw8ZPvSKASOXgKbhwNEy6a1B/bZCP2Qq7fbB/
 rwWGG3+VsplhWYGMjCzV/5hJHtPbkUjMNw6RqLytydlwFNlM4/MMJ5BloWHIrmm9Q2gVI8onIvU
 E/rkDcrss9iLgt5cFCwV0IJdPZPIic6Nb5OgGMoqmQ21pRTiu6GxOY49zMJOihDbgtd9vVGv6Ex
 /hkkon9DJfi7gKUgU4xHoo7nyDDP5c3jM2FfB6oMP/hm+vs2LuExbc7VtXj+QKd+M7BTBqPoiR4
 tZ1dplLGWvitZI8JDLtX0gtr1PpREtIggD79yh5gb+MsgISe
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_190340_104305_237DB030 
X-CRM114-Status: GOOD (  11.66  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Ventura2 has three LTC2305 2-channel 12-bit ADCs: one behind channel 2
of the PCA9548 mux on I2C bus 0, and two on I2C bus 3 at addresses
0x08 and 0x09. The bus 3 ADCs read the valve voltages.

Describe the ADCs and expose the bus 3 channels through iio-hwmon so
the voltages are reported as hwmon sensors.

The ADCs use their internal 4.096V reference, so no vref-supply is
described.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts     | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
index f3dbdece3076..50e652cc37a1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
@@ -190,7 +190,8 @@ iio-hwmon {
 		io-channels =
 			<&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
 			<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
-			<&adc1 2>;
+			<&adc1 2>,
+			<&adc_op_fb1 0>, <&adc_op_fb1 1>, <&adc_op_fb2 0>;
 	};
 
 	leds {
@@ -392,6 +393,12 @@ i2c0mux0ch2: i2c@2 {
 			reg = <2>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			adc@8 {
+				compatible = "lltc,ltc2305";
+				reg = <0x08>;
+				#io-channel-cells = <1>;
+			};
 		};
 
 		i2c0mux0ch3: i2c@3 {
@@ -583,6 +590,18 @@ &i2c3 {
 
 	status = "okay";
 
+	adc_op_fb1: adc@8 {
+		compatible = "lltc,ltc2305";
+		reg = <0x08>;
+		#io-channel-cells = <1>;
+	};
+
+	adc_op_fb2: adc@9 {
+		compatible = "lltc,ltc2305";
+		reg = <0x09>;
+		#io-channel-cells = <1>;
+	};
+
 	dac@c {
 		compatible = "adi,ad5612";
 		reg = <0x0c>;

-- 
2.34.1


