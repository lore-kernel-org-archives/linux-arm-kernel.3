Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14E5C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 07:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5BTR2UUEYw9xbHPHsBuAt3rpko2Ae2+YsLAqCqS6qE=; b=jDMgrM8CfZS0K311JeTeKPpuxH
	65F5MU6FDLSoN4movkqyJqJls9hoqf4hdwINtLHE7ALbY3g4QmTOSz5z84ysJ146QpuCv+fA1MnLe
	GquBMT5TOJjQOfgxJCIJYO6upbcbyEzGJh7j0dOGTBshp/Jhgjb3XIqugFZn1HNhjdnigDEKGeWpb
	C4EfV24+tLAWif/nZbeAg/AvykMTiJ0lULPOC28kLdi0QPGTJDBWCexonQZaDBzvhSljVhCRiNYBK
	H6lUa71xjNtXvbkqIgagISiUcS4TX3zwkNtzPPaHCMH7VpQaKgNGzyX6G5/OReKLvVSVhK477m92X
	4GPrDbnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3zn-0000000Du5D-3W4J;
	Fri, 27 Jun 2025 07:59:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3s8-0000000Dst9-1DhM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 07:51:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7469D5C6846;
	Fri, 27 Jun 2025 07:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3A6C4CEE3;
	Fri, 27 Jun 2025 07:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751010703;
	bh=HGb1vMXe32XsSHfWcRtFI+ZGqVxo4y7L193Fa0hYiy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DKO0CNfZ4IXFHB5zuTVdQuBwCskytFKoc6N8r8vNLZFAqnx4ojvWhjHPE6Q3RFPEv
	 CUirkN7UIYP5clNMpKUH9RifG9a6dZwNFJDG9oXLGc5+3a2HdZFGxzvHkLtTeR3Uf8
	 7EdEoAf0fv6EIjk2A43+zc5oHt9qCkYeH6I7GOY2qC/WirVh1XrX3saKJmgF2P35+/
	 J56GaDz5V32iFERE+wVSF8rBiTDm3xLdBA90XoZ61J5iBHRnuVH7hJiiVlXdDybmNr
	 XmOXBv4R0dEAsF1zlYk2Orz6r5gEGjhdFY8xv15MuOTuy9JTi54Qr9cUSR6yy9rB5p
	 SINPkyZn08ojw==
Date: Fri, 27 Jun 2025 09:51:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inki Dae <daeinki@gmail.com>
Cc: Kaustabh Chakraborty <kauschluss@disroot.org>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: display: samsung,exynos7-decon: add
 properties for iommus and ports
Message-ID: <20250627-garrulous-cuddly-flamingo-b4ebcf@krzk-bin>
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
 <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
 <CAAQKjZPAsE8LGE00fWE1aPj03b6tu1rk9ScTDSN+HeKzVXMZvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAAQKjZPAsE8LGE00fWE1aPj03b6tu1rk9ScTDSN+HeKzVXMZvw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_005144_370056_5431D652 
X-CRM114-Status: UNSURE (   9.94  )
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

On Fri, Jun 27, 2025 at 02:02:37PM +0900, Inki Dae wrote:
> 2025=EB=85=84 6=EC=9B=94 27=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 4:21,=
 Kaustabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=
=EC=84=B1:
> >
> > Similar to FIMD and Exynos5433's DECON, the Exynos7 DECON hardware:
> > - May optionally require an IOMMU to initialize a display region.
> > - May require a port connection to another block, say an MIC or a DSI
> >   master.
> >
> > Document these bindings in the devicetree schema.
>=20
> Applied.

Please wait for DT review, giving us few hours is not enough. Please
drop the patchset, needs fixes.

Best regards,
Krzysztof


