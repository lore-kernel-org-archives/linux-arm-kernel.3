Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6752AD46605
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 17:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqfR1tTDGQ3R+rWkPwW/xMfS4yRk31rzzR/v+CwbJ84=; b=sa70HdkP9IRFyQHzUuMvH9+0AK
	vABfm3AcVwzldkKqALpDOSwS0ppmkhFEtQdcZz03DCV16qiuXjlgfytK/l9MvajQW988SvgAj8I/7
	vR7rET9R8vW6YHVMtQxYYBODKT4Tn9MkmaAUyHq9BF5oT4bOdVU1g6333mY7xG1P/UoC6NnN0nN0R
	pidarrXsrkzZwj/ASGHGAUfEXNzqXXHXpXiAXXoeJNzrj29QQlrt+AioKLG2dX/NOTZUBm1kWtpds
	ARery4fkMQH7rNVQSKKHxE2i/3eM2qp8KnyWmoTYfk1wVog98oG/dvBU4P3uAR39vMZwviFvA61g2
	Qk0SgO/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRL1-0000000Crl3-3WfF;
	Thu, 15 Jan 2026 17:40:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRKz-0000000Crkd-2aiN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 17:40:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 08132433A2;
	Thu, 15 Jan 2026 17:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B0AC116D0;
	Thu, 15 Jan 2026 17:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768498848;
	bh=vdsPn0752ZUNlaPfpcfVirjmE9to0sS9ZCmiPv19dTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O3PF5a3eshlsBXUXlqRZeJ0irz0rLqZR3slSBrlLLEkXsssx6Iz9BwRG+XJZkSBU5
	 pBE3zDZ8+U6SQcJuJvEada1Z5oTKZvq2x3LS+HaB4JELw6BZYmMT8BEdRyvdCad5Vf
	 CSCBdyAKWvHg6GnbYGFuOf+Sub9mRnsfVj53sHjB6t9fYoHKYv8Heesr6P3n3dBaTi
	 2dkHQX5aYbsaGwrtgH2cS/b0W7LuBRN4AaGnGNGs/TTs42fWeOg6EdaGGYpzfv8OWP
	 v67nLdMMwcdBoym4l29C2gnT1PeTHK0U4yQr5wV1BeEeFT0JEad4JwfJtFSJRO7edG
	 kfzeEwoQV6bPg==
Date: Thu, 15 Jan 2026 11:40:47 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Fork Waveshare panels
 into separate document
Message-ID: <20260115174047.GA930768-robh@kernel.org>
References: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_094049_842476_4D48FBE5 
X-CRM114-Status: UNSURE (   8.43  )
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

On Tue, Jan 13, 2026 at 01:05:30AM +0100, Marek Vasut wrote:
> Move the Waveshare panels description into separate document, so they
> can be properly described with compatible = "waveshare,...", "panel-dpi"
> and attached to "waveshare,dsi2dpi" bridge.

But why do we need "panel-dpi"? Adding that requires changing a DT. 
Can't you make the kernel handle these compatible strings as a 
"panel-dpi" without the compatible?

Rob

