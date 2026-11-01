Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F28606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 11:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rWfYYtLu;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LcQKNvmp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RiZmgFh3xnSQBEGWpAS3H5JJBIFZV61jNEtW4X/AT0I=; b=rWfYYtLuRAxlDN
	XCOLPp9xMmdIfK5o98Sc5ufZ7vU0/wcpwpJOK/8c3zukcTiKsiwvHTkiXKCETVz/4CqXzDry9K+iQ
	hiNkYj78eDG0qEQQgbk9AbVqr+6+DQ5dDOAPwCrhazRdVEiogCRlwbPDPzfX4ENV2eAK2sA5dr24h
	iUxRqmlMQRV/4ibpb2WDsR3pnjGtFvrSCBT1O/wlYrXTol422aX509YzGDLJ4KhSll9uzhySyP7vd
	mzSuhAfdyOEtHe4UNf3IkblmXy9i6yTtrTondMiILlE7yzjXQ+0CtSnfbG7Cbq3O1Fzu+twFF7KVM
	xd9m6aehNAqXJFJeKhuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTK5-0000000E7Un-1TBy;
	Sun, 01 Nov 2026 11:02:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTK4-0000000E7UY-27vl;
	Sun, 01 Nov 2026 11:02:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A42EE6020C;
	Sun,  1 Nov 2026 11:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56CC1F000C1;
	Sun,  1 Nov 2026 11:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793530919;
	bh=RiZmgFh3xnSQBEGWpAS3H5JJBIFZV61jNEtW4X/AT0I=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=LcQKNvmpydvM2vMq8mfvYlu/04MuPKvJwFj9o3buJcRNP9d40WBBJBJkzC1S6AGoN
	 Q6wZ9mTF+sTIsymik7ay0AjaVgcI+nUru8+IfkIqnew/brl1yL0UPKOZhMXEI4z7Q0
	 OXUcJ7ZeATEy+k3ztnd+MErlZ64iBLhFS/YeLIuK4YxEIlAR/6kglPiB+EqTQcS59m
	 FWGlugfrx0XUMDWtQJtNAXeJ6OxgMqSESDCrM+g7fqUW9CbNDE7D7ONswj5xFrPdqd
	 gys0B+pSlsKgx1ykwzG+oK40ZBliaPBxWyaUxvVN9+gRM7iZUE+GuueyyPQeFChdK/
	 jsG6XwgFrfYOw==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v18 0/7] usb: dwc3: introduce Rockchip glue driver
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 kernel@collabora.com, Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
Date: Sun, 01 Nov 2026 16:31:52 +0530
Message-Id: <179353091270.2955.16595397888583885694.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=952; i=mani@kernel.org;
 h=from:subject:message-id; bh=fNfid/f4nVrJ+xNTHZ1GClR2jz3hkQhfG2OT1eCx99E=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5xwiFnRbm8Oay8GyVL7tHfVj0GAAiNyctIiP2
 zQwXWMobVGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauccIgAKCRBVnxHm/pHO
 9U1AB/4hhi0dBYHAt/Cc6cpYSYHtZQsQrpamcTe8vNxhzT81wuhwrDZAuJFPG2cdJVsfqwNTQ5s
 Nx/aAsDHKTsLevjmGD1jVkfDamShrSJhhaoBLMh8RPnwS+YY6y3beV+wddieCQbpZd0aEP7KM2s
 XsDh6XU/876CYy6JmbyM6JbSbM7sqacuuRyQGpdPfh+MA0j3TZxikbrSkIxkAVq/rSeKMVWdGZB
 9yw0nmnbNrOzBMWNg3B5tabtYci1zoUr92veF9IbO+2OaNf7LlLooa8p3pq1wA0aGMyF8JqiYpd
 sujQuUxzIcaymM5HhXM5Gwelpf4ISFdSAcrc00ppjsha/HxX
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-21 20:05 +0200, Sebastian Reichel wrote:
> The recent Rockchip platform have a combined PHY, which does USB3 and
> DisplayPort as well as muxing the lines in arbitrary order. Changing its
> enabled functionality requires a PHY reset and as the PHY provides a
> clock to the DWC3 controller, this can result in an SError. Apart from
> that the PHY might not start up correctly when the DWC3 PIPE interface
> is running. This series prepares a Rockchip specific DWC3 glue driver to
> help out with these problems. To become useful more patches are needed
> on the Rockchip USBDP PHY side, which are send separately.
> 
> This was split from the USBDP cleanup series. v17 has a dependency on
> the patches that have been merged to phy's for-next branch. There are
> some additional Rockchip USBDP phy fixes, which depend on this series
> (which is effectively also a fix).

What is the merge strategy for this series?

- Mani



