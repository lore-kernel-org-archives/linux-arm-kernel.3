Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AC5107BCF1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 05:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWX8mp/QqIVkCzDjkHiTCaW5kLocZdjN2u/rdkiH+HM=; b=Df3Wp4y+RdzqPYQfALLPwqLJn2
	Frd1nQlpso8Ec3ygk2BPs6/XPhXfSS3x4crYdZ7oG2994gAXElOUlLbIdUp8Cu6vX/FJI3YKexxJh
	Mv8QYXSt1yBpXmnoJr8wGVgDb+BSoxWsJ1gu9idToHOD+UAWHpHjhsnVUch3m9udtkiTZ3z2cyxV/
	Xjg9sMZKYTr5o4dHr5k/fzJCjOWJFzEiCHaQ3wqIugbuV1OtA1tSzkQeTHy4HBccLoC/+mWNKMz5V
	ccrDN8Km4ZL7D8sUM8NS75rJNT+xA2bJKfw11d1PgkX73USApAAklrCKRnw32eMPWR5J6G0Gv53kT
	HPdLA4sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1HIr-00000001VdA-2FFn;
	Sat, 14 Mar 2026 05:12:45 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1HIn-00000001VcN-0Z8i;
	Sat, 14 Mar 2026 05:12:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=SWX8mp/QqIVkCzDjkHiTCaW5kLocZdjN2u/rdkiH+HM=; 
	b=MeQ95VN4n3ha+2BwoFwvHpHFv7MI+O9MLJjW/VzZXhLMKOs2r4JUFzB2s4dBHs5Be66yuodVSQ3
	LUM980kIpB3EQpQDGrV45J8O7hKoOgXXVsmBJP++aryZ4A5xrd56LjDL7LRdzQ0r1nVEQb14L6iC1
	5ChMbuL/fB95xetB8Ujw6cFFuDAbk6QsDE+mMCRTyY/gfLZVpQmruqWBzEkCG2fXL7KG8j7bNkT0Y
	cqCrOprtC6Y3CbQ0aBBUuRcSQxpHoLZBvARc4HYpGv3LXrxMuguAKNoCx1++K5P3vwPamz1UWbzKs
	EUCAB+xyotFoEP//+1aZ3pMoMqOzWoSnOY6w==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1w1HIV-00EL8L-2v;
	Sat, 14 Mar 2026 13:12:24 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 14 Mar 2026 14:12:23 +0900
Date: Sat, 14 Mar 2026 14:12:23 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: davem@davemloft.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, atenart@kernel.org,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: crypto: inside-secure,safexcel: add
 compatible for MT7981
Message-ID: <abTuNxU_qoQO2nUI@gondor.apana.org.au>
References: <20260303185451.70794-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303185451.70794-1-olek2@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_221241_727590_2C612994 
X-CRM114-Status: GOOD (  10.51  )
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

On Tue, Mar 03, 2026 at 07:53:49PM +0100, Aleksander Jan Bajkowski wrote:
> The MT7981 as well as the MT7986 have a built-in EIP-97 crypto accelerator.
> This commit adds a compatible string for MT7981.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> v3:
> - drop oneOf
> v2:
> - just add compatible strings
> ---
>  .../devicetree/bindings/crypto/inside-secure,safexcel.yaml   | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

