Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BBCFC9ECA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 05:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2JnLgd+KZwcv/H6Y5gFaAahwS9+prfosZbBrOjXVFjM=; b=B0ju3+pZ+khFGMpVYCX2FveKIA
	+jVRNwpzhUQA9eXw/79c3Hi6MOX8obP/w8sGZ3ggsu1FkmlIg6rPKA2IfqNcm6p437OsvT0fD/Zz0
	M2FQvqetXVf72n7hF26eiXT5CDWKQvWaxOL7rwTAGyBSPVW79El1tPshD221cXv7BsDfthPi42eJy
	vdHKCtRqz6sHURe7xI3AcGvf6frd+D8K+Y/wPdc888knpmrggsbxzQeS31e6xBthF4Dxd34TXbkQG
	Bi8HYuqVBqyAf/BnCC1c43RO5V8Ag/rm0DGQIRplwHIkCtcAqG0uLIuG+uo69TwKhGmvCZvdGMHlp
	fs3fBtPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vykE6-00000004ut5-0D3H;
	Sat, 07 Mar 2026 05:29:22 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vykE3-00000004usc-1WDv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 05:29:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=2JnLgd+KZwcv/H6Y5gFaAahwS9+prfosZbBrOjXVFjM=; 
	b=eqiSEHkzZrtmjwCE4EkqwUffgOhRn+9M/T05VQ3mO62aXB+Y1JIL2E149bK79c6lSji8q/jGEyN
	vaCho+2dlsqTG90t4K4HmB+XkNeFwL60oCFcWwqbOpvzeqrIYmRBnKzzo2+P5J3tcRZ6wWh4xN+gR
	Vd7/oEyvShi+r/xwB/5RTcKsWgO71uMkTb013ud9cyf16qqqrhOkqDYYLhyJ4r8H5lERzpfpyFH7k
	Tjtj7rSQCO3IKi/Gl9yMV+hT+nEGSXUMAM7msq8NttxTa/jqvvSVmNDOw2ahpKt/q1IgQ86nnQOeE
	KM9lbwdp2XKs2grgZ+pH/tW6VM6phFbNN4iQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vykDp-00CJWX-0I;
	Sat, 07 Mar 2026 13:29:06 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 07 Mar 2026 14:29:05 +0900
Date: Sat, 7 Mar 2026 14:29:05 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	"Paul J . Murphy" <paul.j.murphy@intel.com>,
	"Paul J . Murphy" <paul.j.murphy@linux.intel.com>,
	Prabhjot Khurana <prabhjot.khurana@intel.com>,
	Mark Gross <mgross@linux.intel.com>,
	Declan Murphy <declan.murphy@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH] MAINTAINERS: Remove Daniele Alessandrelli as Keem Bay
 maintainer
Message-ID: <aau3oQgauYBNWhWW@gondor.apana.org.au>
References: <20260223150622.268245-1-daniele.alessandrelli@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223150622.268245-1-daniele.alessandrelli@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_212919_401161_102F0F01 
X-CRM114-Status: GOOD (  12.77  )
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

On Mon, Feb 23, 2026 at 03:06:22PM +0000, Daniele Alessandrelli wrote:
> I'm leaving Intel soon. Remove myself as maintainer of Keem Bay
> architecture and related crypto drivers.
> 
> The INTEL KEEM BAY OCS AES/SM4 CRYPTO DRIVER has no replacement
> maintainer available, so mark it as Orphan.
> 
> Signed-off-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> ---
> 
> This patch involves two subsystems (ARM and Crypto). Not sure
> who should pick it up; should I split it into two separate patches
> instead?
> 
>  MAINTAINERS | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

