Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B27C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 12:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOKxrsqb2oTs8K0Qs4yW3KUDYy/eQafrIAqX/JO7wOU=; b=zqtp5/sh960WtxYQwwYc5KyVcU
	qOmnTE3Gv3Xw5dzG4sOvswpZ+jqsLOTf3iQme7s1g+T9NDxSfW8VTrnnwNyCS0sO9XdSn3tRR8n9q
	YZ/4kGEfKBFgAatr45q+l77MF+he9owUPmUoEsgvzb6CrMeYOO2L15XaxLPlMhF+hM+dRJk10qShv
	9ouaWzFQlyc9U7VH8uRG5WxwzWXDSwjR6WoPVeqkESK5Jn39WRT8Jfqz4T+u5zON4/Z5B/Xfjxe1a
	gHerqIVF1Qc9TEhYjdb/nDco3rS27BlpsKiIzFHTQc95ImO+PGZqszp1rRvONS/Ound0Smn70lYGr
	rVg1ieBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVUOP-0000000GljN-29ZG;
	Sat, 28 Jun 2025 12:10:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVUJM-0000000GlNx-2FxO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 12:05:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 135A95C4A97;
	Sat, 28 Jun 2025 12:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D23FCC4CEEA;
	Sat, 28 Jun 2025 12:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751112335;
	bh=DttSR+loL/+XwutcRtElHNrAyAfQKYpKcvL9oh1brpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jlBSfVn4ePgI4Y+1FPzDgHJ46C9P1SILP9iSnzYGnpProm9sYoW/Yfz0dZEYBNbLG
	 7xgr7rsmMVS1iP7E41jLMCefzSJ3nU5xYHvsMiVAIDmXlJ6IB9hwW22YNfTPHErpDP
	 a32lkyHkTYoUfFxN8z8ahdTMvan7bAzFaCBh/CKxLsRX2kMdzQc22oBpkWFauji0SX
	 Pk33L/NS4Euj4O3DueYOGBFQrudskK+xJEIFuu31f0F0J1pLc3x+o1KNtlEySNB2FN
	 xyc6ouX96CcQfC+WsPLz3B4jZTht0jN6ZaEoZ0TLzlJkJ2T00KQGK+JNVPEgUUlfdt
	 AJ/oKPUIY/nug==
Date: Sat, 28 Jun 2025 14:05:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Leo Wang <leo.jt.wang@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, bruce.jy.hung@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
	Leo Wang <leo.jt.wang@fii-foxconn.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
Message-ID: <ojyrhi2stm7q6kcd7yl3je36cccbzypsepmc4fvl7venynyu5g@52rs6bntmnwl>
References: <20250627-add-support-for-meta-clemente-bmc-v4-0-ce7ff23460c4@fii-foxconn.com>
 <20250627-add-support-for-meta-clemente-bmc-v4-1-ce7ff23460c4@fii-foxconn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627-add-support-for-meta-clemente-bmc-v4-1-ce7ff23460c4@fii-foxconn.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_050536_618541_1991EE7A 
X-CRM114-Status: UNSURE (   7.48  )
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

On Fri, Jun 27, 2025 at 10:59:02AM +0800, Leo Wang wrote:
> From: Leo Wang <leo.jt.wang@gmail.com>
> 
> Document the new compatibles used on Meta Clemente.
> 
> Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>

Checkpatch warnings.

Best regards,
Krzysztof


