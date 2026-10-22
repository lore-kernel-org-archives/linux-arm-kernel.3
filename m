Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3A8606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 16:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4uNWeMlM;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IbOhdxIe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VvpB1tM48A+liP8mzjt8BtWT/WMCCLO82+YYkxT8nvc=; b=4uNWeMlMT/BtRx+pSN/OXEyNSo
	vl6tZMsD+yQce/pfqu5QmmFWUZ2a0+htVe+Zf2tCXO4mTyj2sNI5cW5ofSEetSPKmwVVyj71vLP0F
	tgU06oUJWa6LlvrSGfKWtCoKWDVM9U8vgIi7LcPjsLBwVd6sdida7YjbrYUczT2moGClk3/opMJ8e
	5Pzo5DXVTCU8Mo6yTMpt6y/bnRUMAojha/4ub18bLjse76K5hd99Flos2vhsaYJ185YL2501tVAjw
	+gOfx8m9LIJx8Sywq3b4sLiPkRw/kAUM1ZcWfBY6rM5Bt+tbwkYq6uzlUkkkcNF8HfDyTibwKwzfi
	9V8fNbIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvw9-0000000EXLZ-2h3M;
	Thu, 22 Oct 2026 16:46:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvw8-0000000EXL6-10nt;
	Thu, 22 Oct 2026 16:46:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 063F843E6A;
	Thu, 22 Oct 2026 16:46:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792687599;
	b=2y+Wk8A4WlWscYoJu+mTGY1nAyZ5+dw8L+IqgiMgARBs5tcalNsi85fcQGPZGYitm2pp
	 D4DHiZ4O5IN3cTQrMVIWtx2v1Kg8DqhBbAPXGTvczdZ6fHI2uPaF3Njd0jCpMD2Sx9/he
	 W78v039lIHYX43AZ5oSnTuEOutta1TPb1oDhN2NfKYSr5nti7WMsHRzMhX+9v3cDcI7y6
	 vp97afP7RD4uCdGswzi920IRy6tPwZhiiMao1GJwBTotbI0iiGYkE3rKP9zG9x9Cf6a2J
	 WFL+I599Yg5rhgivDE81EEBaqUs1VKp4xq1267GHcOn6fWJnFNWwSgfJvR0uQ6z5ICw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792687599;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=VvpB1tM48A+liP8mzjt8BtWT/WMCCLO82+YYkxT8nvc=;
	b=wbY0dNG62vTrHqXrx3UglHHMsqAtViUr8pEpA5eotwgE/+q2QRPPTlYcBU64RcsagjdZ
	 JJArWUCfYiGSA0lm0HnkCMEQBP2vrL7P6i5o2wC4P8EDKRa74lkWp80HzDRNSGwbLPoOb
	 /hIAA/Ev0tEhxn8fUVXCCkRu3qOkd+2Di8LLaTOXU9k/vulaCPWaUqoaqKGQi8Rk7jVeE
	 pJhf2BjKRytnAjY8/rPYas0MhQxkFTZGsKspbXOTLZvomvZ04m01TTePOXzBQHcyBBs3m
	 C5JHccqyK5kLi86rGMeE5LolvCvvdpMW2ysEjj2P5knuFKz6fhGyU3HSJ9RIfENBmng==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9AB1D1F01829;
	Thu, 22 Oct 2026 16:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792687599;
	bh=VvpB1tM48A+liP8mzjt8BtWT/WMCCLO82+YYkxT8nvc=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=IbOhdxIeoYiTur9d8wLjrXRyNNq0SFkMet8Npxu/1fww9/0i0uj6qXa+8Qj4ewyL3
	 Y7DDdNNCLAbSNq1CXy4cyllCBWtC4xjkBblmhAHokcC/HuqpNTji2Dc70LOlQFqGW4
	 sVb/KqJiWpeknjns3Cm2UJXQcm0ZI0MW3SWw6y8+bMC9mZI1+6LQSXKcpZ0XFTvtyI
	 HsMx1t3Iw0jUnIiDqpbmfMF1nTXShDoPjx8ZVBLRIr+jxyBbMZxeZTga5vZ6sLRm+w
	 mFqeyrAOK4TmK6ONzaea12cLPTZhS8Uma0HIITYFPh16GVZ4SaIZNBncKk0tG57u8L
	 YGIDMjBRi6dSQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E8F9441E73;
	Thu, 22 Oct 2026 16:46:37 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Subject: [PATCH 0/2] Add Exynos5515 USB PHY support
Date: Thu, 22 Oct 2026 17:46:35 +0100
Message-Id: <20261022-for-next-lucky7-usb-phy-v1-0-2e47f8484bf4@member.fsf.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOs92moC/yXMQQ6CMBBA0auQWTsJTAhFr2Jc2DKFUVNIhxoI4
 e5WWL7F/xsoR2GFW7FB5K+ojCGjuhTghmfoGaXLBiqpqUoi9GPEwMuMn+Teq8GkFqdhRWOori1
 5d20Zcj1F9rIc5/vjtCb7Yjf/d7DvP+kvrUl7AAAA
X-Change-ID: 20261022-for-next-lucky7-usb-phy-77244b2fc98e
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=me8mjqkDEH3k+r4GPGLnzrCNkQZFbNxiQ3wp8aaLBNU=;
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq2j3s5XBlupmzJ4a/zgSIyMg+7QLmOCmMMMq4H
 3sVdzbgdE+JAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCato97BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+sJbBAAytJ84YhHRR+XnuUu8QYoumKEKfprYYg
 Hu7gNBMqyPPPHZOWq0yopgsvDpLJnyL97ZhTkLK4OgNKhcugsq+Di+lbsY1wk9koHodBB+db4oP
 yi7S+wwCkhx7PbKzcjJXPUvmlSdzl0uXnobwKUVPMCXj5oh2OlWNrwC6ropbfeNL+726eRAs9qZ
 9snYCyTj0W40RWvsc52Ye7x8aq3ath/iuJZwJMVk4JV7rnN7z2L4mKEu3sHHhfrymAi9EtxR6S/
 tFk6lmv8gESSH65GXAvTPru8modWt3P5fwD/RpIDITiJe2gIppo9qrDuYTzBNaZtHHkqpMHWLCt
 grFKLjfJ2JV+fENCrKd97EiH8qOZ4//rcUV29mMBnaKr0MvmYuj/ZO+JYFlfPnIWeFMxTIbFIvo
 1GvJveA7UxEwWiiOB8ORN+jndCA7tN317WgX6FotzhLtR4Lw6zS+hcvWmYTQrHR4/iOc/os1vjn
 Q9U5NTQF/78j/MtfGUzJ4l5ZVCrwSmPxhGOHzrcQGed16K2t72oumof33ZaxrGamJSNXk7vpVjJ
 dVFv8/SfR1te3m/6ldQBsaIFt0j1bz3uuQSUbnJo+Nph6bB8UxgdZPHBpB4uqwhG2+yajdXALfN
 pLZjQS9P/GcCAW2U1HxJKsHDiczkCn8MgYw+WB9ZY3zE2traehEY=
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aidenisik@member.fsf.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi there,

This patchset adds support for the Exynos5515 USB PHY.

The PHY supports High-Speed (UTMI+), and also appears to support
Super-Speed (PIPE3) USB according to Samsung's own code to drive this PHY.
However, none of the Exynos5515 hardware which I am aware of actually
supports Super-Speed, therefore I am unable to test that part, hence PIPE3
support being omitted.

This patchset was tested on a Samsung Galaxy Watch FE using the USB serial
gadget.

This patchset also depends on [1], due to using an
exynos5_usbdrd_phy_drvdata member (.n_phy_cfg) which was introduced to fix
an out-of-bounds access bug.

It also depends on [2] and [3] in that they are the clock and pinctrl
drivers for Exynos5515, and without them this driver cannot talk to the
PHY. It does however build without them. [2] should be close to being
merged into Torvalds' tree, and [3] was just submitted by myself a few
days ago.

[1] - https://lore.kernel.org/all/20261020063559.3530901-1-selvarasu.g@samsung.com/
[2] - https://lore.kernel.org/all/20260818-for-next-lucky7-clock-v2-0-cda0cc80f158@member.fsf.org/
[3] - https://lore.kernel.org/all/20261020-for-next-lucky7-pinctrl-v2-0-b6b0e6065452@member.fsf.org/

Kind regards,
- Aiden Isik

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
Aiden Isik (2):
      dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos5515 compatible
      phy: exynos5-usbdrd: Add support for the Exynos5515 usbdrd phy

 .../bindings/phy/samsung,usb3-drd-phy.yaml         |  2 +
 drivers/phy/samsung/phy-exynos5-usbdrd.c           | 43 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)
---
base-commit: 5260a8a68459dd67262970d38f1b2496f0cad371
change-id: 20261022-for-next-lucky7-usb-phy-77244b2fc98e

Best regards,
--  
Aiden Isik <aidenisik@member.fsf.org>



