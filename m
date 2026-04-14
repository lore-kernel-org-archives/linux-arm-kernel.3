Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40ADEF9D0F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 20:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6geAZuk8+x2xb8Vf/vPC4YutHEzId9aV9SzyoiSX7I=; b=ISm2AtIUeKmg0L0HoMxRPY6Tr/
	9zZWTwsGvow40yup0yRA0KIOoIAZDUpCd+cqPlnHKNYW4eguKn/CaP9Nm7RFNwYORcd8biyhGrm2W
	8m9iwkZYQz23Qexm/vKYaB6lhwaPXLnzDXnDFEMbCJRy+kcd+CHsYRDj5WRluXj9dFO3RBLiAQ2QI
	JtALXVjNZ3/+br8FCEUxPbFqCjF+831OXl6AHg+8P0cXGcNMzcjRNmaKhRNLWzkubSOunnlz1X34h
	C14aFJ3VCH6PfXmo3k7t0+p46q/xg78wrptHdE+8lVo/w1thNFKBWCtTkKtteqLYij2ETVJm0llkp
	3FmhUZdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCkGb-00000000C6s-3Yim;
	Tue, 14 Apr 2026 20:21:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCkGZ-00000000C6m-36LZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 20:21:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E2B24600CB;
	Tue, 14 Apr 2026 20:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A75C19425;
	Tue, 14 Apr 2026 20:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776198104;
	bh=dAtIVeubofBPck88/SI+wYUiOKq07a9wjnhIsv2LFZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jG3caVK/Bv3MnbeQfm2JCp0IttofKc3ean64Uw9LxmcR0Yu0DcIYMLH6wIcZWE/Hw
	 WRYCR3UKtgcZW4QIwCguxVE/ZH2LA2Lyl7BwxexKhYR4IkvtZTXL8oFJFNym4NAXbt
	 177E7cx7Qltw3zD5Lna1XZVwJT6pwNl7W0IyjQF87UnMge+qg+em+b+cSPUCCqucV8
	 BJa5DQFIi2jckmgx6rzMlMNwpPpdc4K/INf8D6+Y9WNBIcQcn0FFbPJCqNoPKxr+Eq
	 tWcMeFgx99zO/NNzCVu9LXUshHGMOItsOz+gq50woUyAQW5m4oN6Ou5xy4FfGdGqC2
	 RBd5okisOIXfg==
From: Sven Peter <sven@kernel.org>
To: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Axel Flordal <axel@flordal.net>
Cc: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH RESEND] arm64: dts: apple: fix spelling error
Date: Tue, 14 Apr 2026 22:21:31 +0200
Message-ID: <177619775022.3727.18063777472413149195.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2338500.vFx2qVVIhK@fedora>
References: <2338500.vFx2qVVIhK@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 08 Apr 2026 07:21:23 +0000, Axel Flordal wrote:
> Change "configiguration" to "configuration".
> 
> 

Applied to local tree (apple-soc/fixes-7.0), thanks!

[1/1] arm64: dts: apple: fix spelling error
      https://github.com/AsahiLinux/linux/commit/c7ff53ef45b2

Best regards,
-- 
Sven Peter <sven@kernel.org>


