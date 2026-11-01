Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DD6606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 10:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CU8lXgMk;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KhJKIToR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FPyMFEUcKXcYLPj3SZ4RXokmH+ZqUMsZhVs5fGpLBAg=; b=CU8lXgMk+oDmp1
	N6smcvxI4XdruuKhUWI66zXTGcirt0vcPxe2oTyuT45VNGzKF3+7Saqtvnd4CaqFBDtZbZ272ZqF+
	RPhdKdgUAn/WVKModWQIIzya7f7+8wnooiOJO95OhIqFg8kRtf6W0aHSLuNFBkqlKs4/XRUTNeWRQ
	bEJ8VvPRH1+Ot8oqZv/6KhUYsEaAUuoiexGl4/+MfaWu3KpeGIdDvTnJpCw95K5z8i7aFy5frjAWC
	uOQHV65c/7cyPDLwmNG2mNTQUhsrWFKOE9EWMw7WOX0jKrBt/ozD99mbw0IJ9QlEbm20zp4sVXeh3
	dQ0LHrsh9bAy8R8cQQnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTFY-0000000E6lb-0itC;
	Sun, 01 Nov 2026 10:57:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTFW-0000000E6lQ-2Pdt;
	Sun, 01 Nov 2026 10:57:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EFAC940261;
	Sun,  1 Nov 2026 10:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806CB1F000C1;
	Sun,  1 Nov 2026 10:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793530637;
	bh=FPyMFEUcKXcYLPj3SZ4RXokmH+ZqUMsZhVs5fGpLBAg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=KhJKIToRNnVOu/L9DG3QM1hLc9WLvW8m9stIsBLvuOc7epIhoEQeP0k9CodQ8fUWh
	 5fbfa6lQAUOOyhuUaEGPo/uhTyCOIw5cwBm8gUeZNiLLUZP/QdHrA9ncB1HUK56Pc1
	 cqRoALNJxCAeVv9BCGcaiTHsv5Qe3OzRAw6vWsvuqhJOBFO9I/tntMSzv5E9+Uwktm
	 g5A59HsbLd5CQYOtuDDgIWWY/3bBd46FPTLBwutOEDn3uwVg/Im2ZXCdATDMY20kiC
	 2ZXnYv/XQT+0lbBlzBYsgYE6pR85m2a8+4PnQIWBgfVxDreDgnid1Xcduty2/q/n0L
	 FZ4XAP5hjYs2A==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/9] phy: broadcom: ns-usb3: Coordinate NSP USB2 and
 USB3 initialization
From: Manivannan Sadhasivam <mani@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
In-Reply-To: <20261021172819.668120-4-florian.fainelli@broadcom.com>
References: <20261021172819.668120-1-florian.fainelli@broadcom.com>
 <20261021172819.668120-4-florian.fainelli@broadcom.com>
Date: Sun, 01 Nov 2026 16:27:10 +0530
Message-Id: <179353063083.2955.13880869162770253902.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=973; i=mani@kernel.org;
 h=from:subject:message-id; bh=+w89rIM6bdKq6eInREjM4c5sW5jCJpKaaFEeIw3A4uo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5xsI/woMZF2KfXqELf41eLLQMq/1ndO4/13gR
 +SaOxyujKKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaucbCAAKCRBVnxHm/pHO
 9bVWB/0VV5UADU7HY2QWHmjXlE+zvoi6miokaEvcjgJxr25wBwkn+tJbiDZCVy1hg7yCz07RtRZ
 SRa7IpQNbZ75i3yJRqToR96W4+M5oMLUFEeRT54PVqFQ5UhnBE5/cvWfDgdplWVOAuHZ3ixp3Ol
 I83JY//S1OOpleOLiv6BNg8ZFFPE958hhmkZy6urVhYzAfmqj4tLVbXl6ZlzNWcCFKq3VvPFOtC
 XhmOyWhyNnhNPyG3imyGd7g1REaB4vnFlvZtecmye61hYu/7J+cXHE96v3/G4SqBfyskcii8a2c
 xZRBU3iegVUH76oZA+1rc2MON9DGgn5Is8iwl+8Pr3vyOXMz
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-21 10:28 -0700, Florian Fainelli wrote:
> The iProc SDK holds both USB2 and USB3 cores in reset while programming
> the USB3 PLL, then releases USB2 before USB3. It also enables the USB2
> IDM interface clock. The Northstar Bx initialization used by NSP does
> not perform the USB2 setup or retain the SDK settling intervals.
> 
> Implement an NSP variant with the coordinated reset sequence and
> interface clock enable. Sharing one PHY between the HCDs lets the PHY
> core serialize and reference-count initialization, preventing a later
> host probe from resetting an already active USB2 controller.
> 
> Retain the downstream delays around reset and MDIO operations, and
> leave both NSP cores reset if programming fails. Keep existing
> Northstar Ax and Bx reset behavior unchanged.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



