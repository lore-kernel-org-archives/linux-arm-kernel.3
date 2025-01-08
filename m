Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19506E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 11:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MdzLiNiMUefIpEMjWF8sA0mgOuEA1ymjFocAvj83YU4=; b=Elph3qGj5DfO/Y1JUDh+TDfc8g
	jj+lUcfJITWVp1dXoz6V5ltmrtNObHyB72acalgO0evMvPkAn6PMde4R0FU+TAZ5Ny4bkCeKyXMRD
	JttqjmHiJpzgN6alfnKhyhaZ6q6QvGCEhF5Wk4Z/M62/+yhl92V1wYRzqLT28iHiqMsJUlTrWpVbm
	2fwx8ltyIXXiVnyJRWT+ys98FcvbPLjDAAFsqaKkdD8BDoa5oAjYuiqiVol1VyBzWkjeR1X3wnSZ+
	pRdP1hF5fGVAvIoLB1bz8bRgbjzSmUlGkA6DKf2Su4PKMheoQWuE88odAj0gaGPyIzhG/wesUakHu
	i3pY+bJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTqF-000000087gb-10xg;
	Wed, 08 Jan 2025 11:03:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVThB-000000084aw-1LuV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 10:53:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6BAA75C44CD;
	Wed,  8 Jan 2025 10:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F66C4CEDD;
	Wed,  8 Jan 2025 10:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736333632;
	bh=MdzLiNiMUefIpEMjWF8sA0mgOuEA1ymjFocAvj83YU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MO1leYDT/KQycCDok3dZtz1b6lChQeKjS47nI43y7an5N4Bourgc3jaRzijGYmyDR
	 uEddCwqBeHSJREvXhnz1HfrlFH6cppD6r2xUMMaC8NO9RX1EyNQjz8nH0Ng7O/Jm5T
	 k74EwS0aMvRpEWWVWjLm9Ix+ErZzdx1jcmEXC8/rhhKGJzwUYT0abRBFqdfyNqrsbN
	 iyY+NNT4c2llVFqWtm8vzBFW/OjWbF59iCH5ZrbLJyw2xQY1Ta1NL+SDGaFcKp0FGY
	 bQ3JT6KdT8EAlJuzOg4rJtqeb66RXgMjFsypTFOLuNhympArzLKxsPRouZoNuhZ+ZJ
	 2JcCjRbMlesXg==
Date: Wed, 8 Jan 2025 10:53:45 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 3/3] MAINTAINERS: Add entries for Apple DWI backlight
 controller
Message-ID: <Z35ZOckf90QkbwHg@aspen.lan>
References: <20241211113512.19009-1-towinchenmi@gmail.com>
 <20241211113512.19009-4-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211113512.19009-4-towinchenmi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_025353_403687_4A742CE2 
X-CRM114-Status: UNSURE (   9.48  )
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

On Wed, Dec 11, 2024 at 07:34:39PM +0800, Nick Chan wrote:
> Add MAINTAINERS entries for the driver.
>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
(keep this R-b if you rename any files)


Daniel.

