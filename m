Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85D0606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 11:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TXMGehpp;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L5CiVr/G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YvFQlOUFIJL8wjzKncMYMsofkDAlkEk9YwsTQ2MFUHc=; b=TXMGehppTn/Mkt
	EGK0bcuQi6csUm3qDawLZk53GLuckhbGGl7T/9Q2+Z6ai3lVI6oRjKgJ+Ee9Mksv8gHuV52XNgVzS
	k08S/C5NTTE1ZgylktD23kiHLhe1Mh/TIq5DUWlHZnvkO2i8P4opVP9lWaSWRscHk2pLUNjXAYh9L
	kCcvh42kdr93t02+ImVqBI9kio6FDGvNwBicE80y9BvwasK65swlGGRLGmb2H1o1k8cPGjMc1Ysvs
	MUpm58GWAg6DeRL8ENwXMMQy8pc3qmu3scy5kfpVPOKDQG8koEsHv3X7FES2HH0O3anwTGq4QgAEN
	OxdmqrTchugel0SCdcFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTMC-0000000E7hj-3SU9;
	Sun, 01 Nov 2026 11:04:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTMB-0000000E7ha-3syp;
	Sun, 01 Nov 2026 11:04:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 99B0140D7B;
	Sun,  1 Nov 2026 11:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC401F000C1;
	Sun,  1 Nov 2026 11:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793531050;
	bh=YvFQlOUFIJL8wjzKncMYMsofkDAlkEk9YwsTQ2MFUHc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=L5CiVr/Gt/fKSnAbUV4j0TATCnPGEWPLW8svHuajzcZRLKoPaUMy5X6l2mzT24mn+
	 xRpp6KI27XfsW5cm8imiG54eGTjCbQ1avu71JjBfO6Uwv+rrKebjAUOB1hEFSwBLUR
	 gTsGXTy1AoTEHbHnPGplBUTzGE5/pTNZDutAX/7TpMp2IkyFqDdqTQ5sBglAzQO3aX
	 jT4UcUEI6Uzbt8iAW00YOmyqV1yTr+8tZbxsJef1d8ua++GIRBSmkY7/Mbcegi8wuY
	 bk791VEzRcK/DOmw2fkp7xTBlv+1lr+6FwOudFz4WOg3zaQHMjh4RI1kRYZuaxz77/
	 FxUpnRx0Uh/tQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] phy: exynos5-usbdrd: Add support for the
 Exynos5515 usbdrd phy
From: Manivannan Sadhasivam <mani@kernel.org>
To: Aiden Isik <aidenisik@member.fsf.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20261022-for-next-lucky7-usb-phy-v1-2-2e47f8484bf4@member.fsf.org>
References: <20261022-for-next-lucky7-usb-phy-v1-0-2e47f8484bf4@member.fsf.org>
 <20261022-for-next-lucky7-usb-phy-v1-2-2e47f8484bf4@member.fsf.org>
Date: Sun, 01 Nov 2026 16:34:03 +0530
Message-Id: <179353104399.2955.18059371046251578542.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=333; i=mani@kernel.org;
 h=from:subject:message-id; bh=k0kivXC91YJ9ydGLFjgg9cV2aYT/3fbfHC2TkzZeQL4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5xylPm/36572fC7jalo3M7lGxtto6fI6GyvDS
 QmfTEoLEcCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauccpQAKCRBVnxHm/pHO
 9ei7B/996lzB9IF8yZ1xlFjW/Q9LgKlADFgT+zK7F884JdRlmnuRYi4YD+5xiwF8H3rz+e15C2q
 JG+CXo0X/Aj/Yvm/kK4m0t+GdYTVNiLvWofC+YarL/m0YIU4ybxZvWsZTIJrj/VE0tLbsBxQmDa
 dtanz5ce4gLop0Q6/mV7v44Qn3/9GdIcyV4OUaktdACKRDTyXJIlm/NxjsPwIaoYfyKXCkInPc+
 jZCFGc1ODDYsSVN3mmnAcjwfQan/bR6OLzd1yp1YOPzVn9nkDDG57GwR2y1lhreXKGQGdBvbCvB
 bw+Z82YI7RvuAIet5jKu7Y8EbuPSjxipnnKHP7XItfdDEufi
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

On 2026-10-22 17:46 +0100, Aiden Isik wrote:
> The Exynos5515 USBDRD PHY is a USB PHY which supports USB Super-Speed
> and High-Speed. Add support for High-Speed (UTMI+) operation.
> 
> Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



