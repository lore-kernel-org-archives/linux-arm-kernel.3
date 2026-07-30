Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D252C55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 08:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UuuLUuawaayCJVuDTZJqD2lNszQ3OigHxJNv3y24qV8=; b=b3sdP538+AgMolJahtl2UjCr1k
	lFuLqXPiK0pnWrqbd4dS2IL47BSTsRVA83DtYSGcmsg6xz6G0qUBAzviCDiQN6wT8dKdwWyDVPFHe
	y0dGQAvFhJdaVmvWPGjydWPc8vr6PyCTNe610zgE/CHKjild4+TDp58AXT5KegjI4Yox+AHdFHgr9
	9IuCxdJRPlutEyJevxn/lNK5KE3p/PLt84kSLiAXmXlOXqldthsaxYeKTssvVO+UiezHQ9+s7Oj/m
	HEP3/5ZMLw/J0ePUayQ/6EuXyoAu6k+1V2zIx+g6G987Cj9JUjG2Sd8In56ZS7Uq0I/vU7+6FSV8z
	OvJFuQKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLuO-00000009pRM-1du9;
	Thu, 30 Jul 2026 08:14:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLuK-00000009pQc-3cbk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 08:14:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CB8343BAC;
	Thu, 30 Jul 2026 08:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B1241F000E9;
	Thu, 30 Jul 2026 08:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785399264;
	bh=UuuLUuawaayCJVuDTZJqD2lNszQ3OigHxJNv3y24qV8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nxhmCqfPlK6UIWU1sS5+Y0VftkpBIE8Ngc3sN/jyWeajNWkVM92b4eVd5W3b0I2bu
	 Jvfx9dydDPVeP7cxzwIlz02k0S/VfP249AjJAXF/+uSa2SXRt0zK54bGV7a2wZ/Q8a
	 lAiHC3O6+PkkIH9PRWhpyValH149fYsCqMIfVRKRg6sPLcQGl8XDFQLQGwj/d12X+l
	 9bIiTPEEbealMSLyWzZ578tcajeDUSjdlLXN3sDQQg6Tzl2EzVsG7SrDdLIvyTe8di
	 QRkzR//8kMILjAXdfcdNzquVFiT6r9SjZ+Nwwmqs6N1VAC09tvgN+5kAnOcW+z+ZOS
	 OPUxFmFnDfppA==
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
Subject: Re: [PATCH v3] soc: fsl: dpio: fix kernel-doc typos
Date: Thu, 30 Jul 2026 10:14:05 +0200
Message-ID: <178539922196.574381.15816296584474390241.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728004938.905415-1-rdunlap@infradead.org>
References: <20260728004938.905415-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=291; i=chleroy@kernel.org; h=from:subject:message-id; bh=By2W1VB8mqUfqZp8DyWN2xoLqcwcwcJYHG2/1C1d5oE=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWRls1+UWSJ805g7qITJoCnmbiWjSpAi3/HSPyK6K1MTf K7PL+bqKGVhEONikBVTZDn+n3vXjK4vqflTd+nDzGFlAhnCwMUpABNpZGX4K+wTonSe05RLK3tD 2Yn9a3ZX8F5Us0rvWssfMnl7tu0dJ4b/oW3fy+cp79E3/PnQOnbR5ci5cqkHNs9v37Rh7y9vuTZ xZgA=
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


On Mon, 27 Jul 2026 17:49:38 -0700, Randy Dunlap wrote:
> Correct spelling of 2 words.
> 
> 

Applied, thanks!

[1/1] soc: fsl: dpio: fix kernel-doc typos
      commit: 13dadf4581f774180665083c3342a3928dbf677b

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

