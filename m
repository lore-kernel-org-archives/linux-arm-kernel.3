Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B375606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 00:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CBaniSdk;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DhMFgiK+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sz2NiJZ3qIKEXA71rCBDrOKHY9+zaIkwX4bCGBQ323U=; b=CBaniSdkhlDNse
	SjnomVjvMsw2G5rgs+Kf/fZJMCBIxMeMN6zwsW/7fseLBcQSpXxO0wG96mwB9PwHw7yPZNC/l6jNc
	LOJjsT0x/S0RxuFPmFFBLBHDrrTUuA8c1Htn/wdNj6QR7KY//epjgqVye3ANn3vnMy61p8vrcTTMP
	WrQka0j8iuZ0FrodRcw64jIwkID1qeLtEexNcEGQMyPr6ejtJm9tWJYyjmP5RQOh3yO3ma37WusAe
	mXljCyEXdnFIRmRjqJgkqyU8dd/NP8Z6Wn1ZFt62fsUhFH8+74fzk2vULOpvc9vbh7H7jzWfyp0TR
	3mcWHansFnQGnPQsvtNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMxB3-0000000CmwA-36M5;
	Sat, 31 Oct 2026 00:42:33 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMxAx-0000000Cmsr-3OS5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 00:42:29 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-36a18fc7a38so531828eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 17:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793407347; x=1794012147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sz2NiJZ3qIKEXA71rCBDrOKHY9+zaIkwX4bCGBQ323U=;
        b=DhMFgiK+kkZLaZVu6xwhKfSq2utnk0IQu/UW94jeoc/GtUJv0bY1+zaZ+KvVSy+0Yb
         rqLyf3z17tnBY09zLAw1FqNQ8wnBJWPG/BGiX7aX7QNUW4Dy/2DXGn6XlGzGqv0iuK84
         k2FS4s1kUWV0ogDP+ifDO9WRIUbrDLYjmyZQFOONRiEiJ1uHTzl1AY8NPJzST8gLW2Lm
         co4Aom4UfVzXR/JUBqJaquSf9g7m+rPOJsSuZN8Hb35yyRtQmTCHwYM+01pKKNVtw6MB
         kv/EOZNgrLBkTyMj66uKaIv7HAPABhcAkV8qqOZV45/0lRwN9OBswxl0pmmvsZu0rjRO
         3xTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793407347; x=1794012147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sz2NiJZ3qIKEXA71rCBDrOKHY9+zaIkwX4bCGBQ323U=;
        b=dv7x4jkb/PAhW03Cd5t9zilmbHmIJtxA07i46g9dAgzdDpOco03tTqvkMHZLS5Fn+S
         z5UwkqrS8W/sEaAjciyQUDLaO/rzLTpGNhjZbz2YK5XeW+gL/BqRBsS8roPztyzGAUXk
         pL12HyFrz+HlGGHvI7tc/W0QmnjUTrBy7w9SB86xs07GtoyNFP3JsDwoHaE/Ro83k6Tg
         TlDAQ8DeOpl+Y2D509dApd9N3i9j6fWwA+ZK2CYVv3BqM3IgX1HNEdS5+vhvHb3ZJxFC
         Ie4EJVAP8LgdK+zvwu1Djiu0Ezx/h0eLhTlbgxNNEHG7CfvJSy+EjFe3EotjVTd+qb6z
         94uQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfA5eKOWr14uKrQ0AEZ3QqJf1+iTNqHtUg19BT41mA2fhdrNetkrsX2UsFJPKIX9N5IsJUeIE7c8OopejUGrop@lists.infradead.org
X-Gm-Message-State: AFq9FYK68FjMciXs82tK5NEscGgSkswk8+qGpmzfQ4dN08Gc3B0g0waf
	AeWnyCA9szApWzMcJRkDpZmDVVRNJWbgGp0Rj2704rZ93Kegj7a5JnMinxqR3kXdZio=
X-Gm-Gg: AYBFou0Q/OK8p5sytd9Sxcu6p8SrGW6ZAX9onRweO49R2aTn6Z+FVVmn47s8kS817Ud
	cyCL6VFM6EOEO9o7I0t4EV8UVTaiumhkm7BkdqVm4cMTJrb8pa2XvqIkaBTCgRLjBk0EwR1Y5S9
	vqJrNJUtkobX7xY6LIQA7FND6yDTHzTNfjyAAP3rGBdaWFI0tgs5Conqxx9e1431gOuZP+KDTx8
	lZXP2KecZF0mTVWpOl1kg+NYOMrHEPIB7F/mCJX6Wi6A43ZyqWQL3VRr7ghtmyMMKVHKFqgNRvz
	TLongF5qN2Wq7yr4WtdPTuyI089H7DgxcxzmntPIHEScPxGMILiofuX5oR8vxGMWIMhiE0Dm2xf
	E9dgQmXPo0Z+LwXl8XGLbjMwedi8ZD6v8mvAbkp1zCmdJQrd3JrKvCCxcwPttMVT/AVH5rI4RpK
	RLMGbHDGDYz1foidyWzIfrIfIvebI4fvnifmECsVsHPL7vE6Irx1yOibF/wIbCvWj+nElOfldpQ
	zKjVqeRCYc2vEHLlCdbJ0cxgFzQBdKNS/C3vz9prlyODwCLoo2aTpGLb1//fVu5kd5sNrnXBqSp
	fDhXBnHSpSrA0zZkp/UWTx6mliS/QqnjNPddc/4LkF6c80r998efKtoZrXkFnfXPEk2qUbE24SJ
	LWw6Kb1DZgAVo5761duEwjihwB39e78Hazk2QeLcQv2poxv1TcLMlfmr6u3Zq8xPvjr+pTanZxW
	VV/Xoh3wrllG6qGq3/N4WNYsYyD8XkNbCN0T5a
X-Received: by 2002:a05:693c:65d1:b0:36a:3407:26ed with SMTP id 5a478bee46e88-36a4243cd68mr5338049eec.34.1793407346852;
        Fri, 30 Oct 2026 17:42:26 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af91bsm10889097eec.8.2026.10.30.17.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:42:26 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH 1/2] tty: serial: samsung: pause the RX DMA channel in stop_rx
Date: Sat, 31 Oct 2026 00:42:16 +0000
Message-Id: <20261031004217.3340610-2-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031004217.3340610-1-samarth.colleges@gmail.com>
References: <20261031004217.3340610-1-samarth.colleges@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_174227_850839_F54B3189 
X-CRM114-Status: GOOD (  13.68  )
X-Spam-Score: -2.1 (--)
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In s3c24xx_serial_stop_rx(), the driver pauses dma->tx_chan before
reading the residue of the RX transfer on dma->rx_chan to determine how
many bytes have been received. Since pausing the TX channel does not
stop RX DMA, additional bytes may arrive before the RX channel is
terminated, causing them to be omitted from the data passed to the tty.
This also unnecessarily pauses an active TX transfer, which the driver
does not subsequently resume.

Pause the RX channel instead, following the existing handling in
s3c24xx_serial_rx_chars_dma() on the RX timeout path.

Fixes: b543c301c2c5 ("serial: samsung: add DMA support for RX")
Link: https://lore.kernel.org/r/20261030162334.3000737-1-samarth.colleges@gmail.com
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/samsung_tty.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 4eeef149b..2f6c69bec 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -553,7 +553,7 @@ static void s3c24xx_serial_stop_rx(struct uart_port *port)
 		ourport->rx_enabled = 0;
 	}
 	if (dma && dma->rx_chan) {
-		dmaengine_pause(dma->tx_chan);
+		dmaengine_pause(dma->rx_chan);
 		dma_status = dmaengine_tx_status(dma->rx_chan,
 				dma->rx_cookie, &state);
 		if (dma_status == DMA_IN_PROGRESS ||
-- 
2.34.1


