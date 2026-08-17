Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F774C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 07:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMKlIBl3NAuuM6jvx30dD/Hizd+fyHJnLS0PwEyzfBo=; b=mEOqpCGdLJLrDxhuSvhU1ThRzc
	ihpL/8LQZ8sdhhXZrxduxA+zFBeedLB1dnecFYWGRzrYnM704QI0kj73FyRxARtnVhGI7VpWd1J9/
	yPaBoWw8FMEf7407Wod6zwKYMRIZSbEWsy/obYnU8wYOKtTCIjgv6pPhNULBCtc9H8w0/NASi8ZQo
	OqUX78N3ldbQwGxT7Wf2jqx3HFlRKFfYcNk0PofClq40wt80UgrQFVZxCDtClNaxZbCBf67llExn0
	m6G3DLWFS+nOF/yKu3psDj1MLPmspa1GKmf9H6NWuo8yWKWLq6C8tjKsjERL6VL09aBbXX5k9ClaJ
	6LKFiQZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvrZu-00000005WrV-1JpX;
	Mon, 17 Aug 2026 07:16:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvrZs-00000005WrM-45Mu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 07:16:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A352601E9;
	Mon, 17 Aug 2026 07:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA681F000E9;
	Mon, 17 Aug 2026 07:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786950972;
	bh=kMKlIBl3NAuuM6jvx30dD/Hizd+fyHJnLS0PwEyzfBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ls9iI2r+IlBlLw9a/a2pq380+4Uj4p8CPg37Pz3IGZq7RfdNs64ygbmNAoFmBPYZQ
	 XCupHoFDg7lHseSajml1GcWDUKKp53Ug/1m/d4VR2KXi0EnaQu6tJnA8z1OMyC8jua
	 ncy8dUte2S9BS/+u3r99QD8JIW6Ne649nZpSqlJakA38BclnVUN55lVUrfkFcAUfkm
	 gtEELzBCzyBaFe4YKFlAgVwc7AcBN/D/7zZ/xWaMgZYoq4Xoub9qIYsH2veCwMJ7Do
	 Dfd+C4Rvovr72/qUTDNsH9uraVuRBIa/um8PE01cWRDUPzspnQhOoz2NGfeIllKLnt
	 5hWhphvCtM8Wg==
Date: Mon, 17 Aug 2026 09:16:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Corey Minyard <corey@minyard.net>, 
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, jammy_huang@aspeedtech.com
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: aspeed-lpc: Document lpcN alias
 for multi-instance SoCs
Message-ID: <20260817-icy-peridot-mouse-ad50f6@quoll>
References: <20260813-upstream_kcs_multiple_lpc-v2-0-775b1db3fe95@aspeedtech.com>
 <20260813-upstream_kcs_multiple_lpc-v2-1-775b1db3fe95@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813-upstream_kcs_multiple_lpc-v2-1-775b1db3fe95@aspeedtech.com>
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

On Thu, Aug 13, 2026 at 02:42:31PM +0800, Yu-Che Hsieh wrote:
> Some SoCs (e.g. AST2700) expose more than one physical LPC controller
> instance. Downstream devices such as KCS channels need a stable,

We do not care about downstream devices.

> globally-unique index derived from which LPC controller instance they
> belong to, so document the "lpcN" alias convention on the LPC

New aliases are generally not accepted and if your reason is
"downstream", then answer is simple:

NAK

Best regards,
Krzysztof


