Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7A5606A322
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 00:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rGvSipzz;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COnt9P60
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6Zn8ogGo3EJrK8xLaTC29uAmsx2DQ8Ou6DfNANGyHlM=; b=rGvSipzzfGBuswLWr+YQjIW+ew
	yL3+gMTtDIojWzKzqv0Uk/SyT7r14NoH0tY55QC9ozXizljC+SUrzT5O/2iXQZiW+VUnDGoi8nMbW
	HdNEpF6nY8fk649AO1TfRcnKerI6Y71N6Wpwykzw9yDK4THAIv6EGqoPJ3zmaaPHbTFbIfmse4jPi
	x1A7WBfTmxvLl2sOU2eFDEl0ZhkU9M+AJwpW3++FD70bSVPtBPyF156cLWTu2tndtP7sw01m2LIe/
	i6fZjOfWZ0lllpUcYh2xldee2j5bOh0fmm5Z7QLObRkRCIk5Wwy7KncSjyyfc/BdCsZql6N3GaapT
	STwVwHsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMxAw-0000000CmsX-2gvk;
	Sat, 31 Oct 2026 00:42:26 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMxAu-0000000CmsB-1ZR4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 00:42:25 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso620231eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 17:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793407343; x=1794012143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Zn8ogGo3EJrK8xLaTC29uAmsx2DQ8Ou6DfNANGyHlM=;
        b=COnt9P60ozTtLCYjuTGWY3+YeXJNoyxgD8Kh62tjBoB5hXiFktGBZ4D3SpSP65wXbd
         IxJ1oCLnaWUPQDFQtxj4hqcO3SNY2sKuc6tE0b65OFn3VSLBYWfGmuV/iSO3V8NIQtQa
         LPR8NZdqIn+SrHn9kUlEWMxv6mbWTqk1il4PqkEW87qB+VfivV0MbLe9e3+wMhtpv3b0
         6bcOLHftAXznsp90Z/lWp81z8Ecgli/wY6voelWNfz0Fd663lEayBj7qI0y2WnVn0O/l
         WCVy4MvvJBAb+LcUcfN6K9TWYRg7Xhezbrq7m4+jGOaTJqNZ9eKDAQW1xIeyktSTUgJ1
         oX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793407343; x=1794012143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Zn8ogGo3EJrK8xLaTC29uAmsx2DQ8Ou6DfNANGyHlM=;
        b=tgigqEEdlIv/WWbbG+Q+lzBGmRkS6EMCBHR1eXcxjWnJY8IvRcyNRxfhloBae2NMqq
         MxuZXhzlSt0AfCwwnWKSJWQB+W4urjvXex+g9rxOJTF8yDpZBhbehwxK66olxdAbUSnC
         XDxYQ0ih8A+gXPIVAWcoXTJWlZEdEVFWsaga0CMzzPoPOIYEBDQ0VlF4XHzTADEHyX/N
         R0TmQRA4AOEhsG7tAlhXHQ5pXtX6P0A57ejTmU4n/24+dT50YsrCh2RDF5e73RheaKs9
         MXXshlaFcwipWhmbcIQNbh6/o+gA0kH7YPPm3gTv2U4Wy34d7Qj4VarKUhQf+iIqX6lr
         j/oA==
X-Forwarded-Encrypted: i=1; AKwUvBzTTXmMtt6kaBFgEK2ccp5PJ4eVJ0QGmyumm3Usgr0Iu2Dn/6VMUJJZ6m2jHwTRcT+DNzd2VJHxr0IaNPgO+Uss@lists.infradead.org
X-Gm-Message-State: AFq9FYJUlB6WaOFBbmZlALMETJAGuF3iav9gNrucEOuIb/cBvHVGQVkt
	OAgwy6/fhOPQ3yzpNw1H1oZFxEOQqtVNN1P4rcwcasD6elDonEQfwNJJ
X-Gm-Gg: AYBFou3gnMFXy6Ph17FFCCLZ6mVJxbzmHyGIhLhvXH1rvh7bDPB1ZIjH6Br2klZEqSR
	OS/z7LIcv20rhPrQGHyLFqp9BkYHseV/pkJtrE0umqcMOfondJbC4zd+CdO4yru6xQH5QpNGaCD
	WFfkzs2iBKXUM5KYUXLPGJV0DY285JzALefs1NRiVyNKmVLHXwf9AdvhI1xs1iuP8OcLVtWAURB
	dWSV1tle++apZ4+oSIiqCZ9s16etYZrNi2tKPeoEv/67+SKNCUCIOPIOoRyniJBwvq+UcTosNNf
	QzRmRDwX/6wcmor/YYMXGZbjTgE9XQ1Ccs3foBc59dJWa0oowe/TW9cI6pUoMvTO0RloKVQncy3
	9oRw2Xi5BWAFDo9x3OpYGdpyLGVTFN2o2HQTVAcCZ7t3MHWx1l5ocKUvzfRylOX7V8jvY8y9Rwr
	nTSpWxBeZ/P/+9mhpSDHAIjSNhVRV9Cs5Nwj5YNPNWXnsmxIrIxJFymMejNnyhN6MPTFLd1HCmS
	KbkSCfaoT3TWbcBfDaJKQEIgfwN59OOx5nGjJfIwN97B+xteZablmWl6pqUUz16KtWXiwy3EmCF
	/dTQglValk8oaVE5n4xJkpcCibxtpIh/ueDDF//wFl2Dh4HyV89AYNbW1kE5zubn2vcsbAXRS/H
	fD7FcL2FWNU6gubGj08Xv1uxiL/Qr1wtD1ZhhQYYkDZCVp2m2EeUFTnF+qFwxUjBCSueG8D6s78
	CWo2c8YvWXhpYOb41K
X-Received: by 2002:a05:693c:83cf:10b0:36a:1427:3933 with SMTP id 5a478bee46e88-36a4236e7bemr6281218eec.16.1793407342986;
        Fri, 30 Oct 2026 17:42:22 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af91bsm10889097eec.8.2026.10.30.17.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:42:22 -0700 (PDT)
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
Subject: [PATCH 0/2] tty: serial: samsung: RX DMA fixes in stop_rx and the RX completion
Date: Sat, 31 Oct 2026 00:42:15 +0000
Message-Id: <20261031004217.3340610-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_174224_441524_1BB365E0 
X-CRM114-Status: GOOD (  10.55  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series addresses two RX DMA issues previously raised under the
release_dma patch [1] and subsequently confirmed by Marek Szyprowski.

The first fixes s3c24xx_serial_stop_rx(), which incorrectly pauses the
TX channel instead of the RX channel before reading the RX residue. The
second prevents s3c24xx_serial_rx_dma_complete() from re-arming RX DMA
after reception has been stopped or during shutdown, which could
otherwise start a new transfer after the channel has been terminated.

The series applies on top of [1] and has only been compile-tested with
arm64 defconfig and W=1, with no new warnings. It has not been tested on
hardware.

[1] https://lore.kernel.org/r/20261030162334.3000737-1-samarth.colleges@gmail.com

Samarth Narang (2):
  tty: serial: samsung: pause the RX DMA channel in stop_rx
  tty: serial: samsung: do not re-arm RX DMA once RX has been stopped

 drivers/tty/serial/samsung_tty.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)


base-commit: 83f32c773255720a661aa45d83e36278135f23f5
prerequisite-patch-id: cfa1c1db9d23de3ae1cc6f0476a8ac611d09c7a8
-- 
2.34.1


