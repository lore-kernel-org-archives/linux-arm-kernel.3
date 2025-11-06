Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0A4CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 17:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lUYNwn621b4INnVv6cYUd9i8ygchqkVKYYeeytWLys8=; b=p06y9RAjdxk/+mu8V7J+9Jfg5b
	1UTLtOlBr/0JbiwyaUcItRkHSRi7UAUBimETlsEd5iDbJxJUaOvOrkdHtbXNFNHfsLz9JZs7Mlo5v
	yHYpwouxL65YPEPtnOJhDGpczwYHZhu3VNNZwNHbKak1/S+vRy5rmDwBWf6hKcqv4xqEPjfcFm89Q
	Ik0qIf0Fr+ga/nHcVJG7GiKEnFLVzTz6omQ86PMo0fwoU3aPtJND8NkaoTPuQP7yQm5L3/vWjuAS6
	jZ76/Ygsu6gkATbke30Cco9PDM6eVdH8jBNgbRLUJiD5m28ZE/ERM16l5LSM+7Rx25XG06C7J6CFv
	KqQod5pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3lb-0000000G1AO-06sp;
	Thu, 06 Nov 2025 17:27:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3lX-0000000G19v-3RwQ;
	Thu, 06 Nov 2025 17:27:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E2AF74433B;
	Thu,  6 Nov 2025 17:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC827C116C6;
	Thu,  6 Nov 2025 17:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762450038;
	bh=lUYNwn621b4INnVv6cYUd9i8ygchqkVKYYeeytWLys8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AmMzs73VnjPXmC/0CawgwdAAECJ1wJXAWnwMQs7cvyNsJ8gcIKEmofrUeLkYBv1bd
	 1dwbVsduZY9Hh2P4Er88otWdF/OtGWQBj59m5EtsoxzMWIQqz4I/gg5CSBj2A1TXk5
	 +CDYE5TE1HSL3IZtGbNZ/4X9hMqqYJj3wEvS3IweFoWj2AE2jtIarNJYcPWV3e6Try
	 T5g4cl/zNIMVWgstSipeHjVO7I4mYPDg0HSmdLE1UpofGJZx4AuNIgH3xfYWXSof1Y
	 TW1r3xus5GPisF2NMyuBSwOVbEIQhFCmZEWc+SbXjqHg69Zu9aFNrWLLQm5Z4gR/u/
	 7DpEB7V12nwxg==
Date: Thu, 6 Nov 2025 17:27:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH 2/9] dt-bindings: phy: rockchip-inno-dsidphy: Add
 compatible for rk3506
Message-ID: <20251106-litigate-cultivate-75a4aac333c7@spud>
References: <20251106020632.92-1-kernel@airkyi.com>
 <20251106020632.92-3-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V33MzIjcuA2BZAPY"
Content-Disposition: inline
In-Reply-To: <20251106020632.92-3-kernel@airkyi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_092719_879079_1F3716ED 
X-CRM114-Status: UNSURE (   6.47  )
X-CRM114-Notice: Please train this message.
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


--V33MzIjcuA2BZAPY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--V33MzIjcuA2BZAPY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQzacAAKCRB4tDGHoIJi
0hUTAQD7NwjnqRmBmopmm9xS3ZqfaL4Lj+EawXUG/K8Qy/2v1QEArBXv4nDqLv9S
VD0Fl63GQYh+57qF0vwhbIjEcBRyQgs=
=XWuK
-----END PGP SIGNATURE-----

--V33MzIjcuA2BZAPY--

