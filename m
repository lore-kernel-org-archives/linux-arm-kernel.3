Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670C8C55164
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 08:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0awF699iaHXQ7IDP9u+2DZ5xUbh+hdWpBExaW+7TnD0=; b=3FMtPmC0OBsf66EI9XgsoUYLOI
	PZc8H0LucDhEE2G9XNgajX3sL/ZFYgbibzW3iq4iexODs8OFGMJt51+ZWcWRNBlU9bOD+rs0rurV5
	H9M5CKnEp1IWOSFAfNlISHnhRyqBh6xvyK3BTYCA4kPoIKD/uD7hfUAqpDD3vHLj7CQZSQ1KNSXPf
	7ociGFhetO7HlRqHHn7NSrb4XdBpCvIN6DoSs7VJ72FRWLS2b8hAfH4vqRgSVtYXqbUKXQWl2zswH
	N9vgmfm7ibdplBdPkPuXqNDQvH1F9i0CISUmq22A65OueOkdwWIr+MB+l7pHtH26l5BfVAhZgpMJT
	lD72apBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLur-00000009pZc-2G7R;
	Thu, 30 Jul 2026 08:14:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLuO-00000009pR0-2fMR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 08:14:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 04FA760A66;
	Thu, 30 Jul 2026 08:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9F31F00A3A;
	Thu, 30 Jul 2026 08:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785399267;
	bh=0awF699iaHXQ7IDP9u+2DZ5xUbh+hdWpBExaW+7TnD0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IB1TnayQfKNzUBaSupyZ7MbfBAz01gulj3TLGj1Bwuo4lKgvGx8YHjzyhU7ohC1kS
	 IS88Pw70g5y+I9jLmZT91QNmESlJBNxSu0zH/VT1xxEWzs89EDXC5aUlGJdEZjpiHZ
	 2kPipfvUf37NzHe25mNccY87yYPhFmtmBhEOFQpEksjdwAOrbf4qO8gI+/C9U2vO5K
	 czZeIivdczFZV4tqWglofYax+GUGs98XDNzAfkz3zqQb5Zo+kS4Km3mcnfcv2uaofp
	 CS0Gkaz6+wykuKKCRzrrk8b5zbcD0diDq00k4NbwstNy/xnb7Xtx21NmXNH7IWkUCZ
	 e0CFmtwgUK6fw==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Christophe Leroy <chleroy@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>,
	Guanhua Gao <guanhua.gao@nxp.com>,
	Roy Pledge <Roy.Pledge@nxp.com>
Subject: Re: [PATCH v3] soc: fsl: fix kernel-doc warnings and typos
Date: Thu, 30 Jul 2026 10:14:06 +0200
Message-ID: <178539922195.574381.190484277984136967.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728004924.904210-1-rdunlap@infradead.org>
References: <20260728004924.904210-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=498; i=chleroy@kernel.org; h=from:subject:message-id; bh=GI9klVCerpi1vEXP4vDD3h3VHIlMwDNSBV979hEqBaU=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWRls1/0MLJUPOaxyOX63Zkt59eFN55O/r8tTufmET4Ny V8SDaxrOkpZGMS4GGTFFFmO/+feNaPrS2r+1F36MHNYmUCGMHBxCsBEtucx/I++s8h3SvAv8YjJ wnmKN/nLDd9XFkjr8KVsWyAvNTN7zRFGhr1nagQ0Ni0IerpH/tCDr2/Mbiw6+0tWlblvyYlPFxf 7iHEAAA==
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
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


On Mon, 27 Jul 2026 17:49:24 -0700, Randy Dunlap wrote:
> Correct spelling of "list".
> 
> Fix a kernel-doc warning by describing the nested structure completely:
> 
> include/soc/fsl/dpaa2-fd.h:52: warning: Function parameter or member 'simple' not described in 'dpaa2_fd'
> 
> 
> [...]

Applied, thanks!

[1/1] soc: fsl: fix kernel-doc warnings and typos
      commit: 2c1e7396f54c39ff0591b15fede6813cc85f5f9f

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

