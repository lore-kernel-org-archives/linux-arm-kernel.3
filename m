Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BE8C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 21:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=py2srKe/VUlaRaDsXeRpCylQai2Yh6rNvKsF3n47Rgs=; b=nYtkZTd5Jy8cHV5G156CdcOdph
	JAOJWY+Etc8S+Dfij7CFAXLTiyIljvE8Bb/qTOAoWQIn9u1wlv45luNK3VV156psz2ijWPiw3Ease
	K9vx7krG4S1gNFxlIBqudB3bYw3pmk77KfkOt5UxpoSeif4HPCsEEb2k5Nu/VfVa9P6v1jjuUvIer
	GxI/wd2l3TsuCGdSYID+Nbr1Fr21rEQ5DUuNIqmfk6ekfZXoTtUAx6tbO0Ufn1+5OgNUCUhC6Orns
	WOQSPsPXf+vdMtsMieiXwEdRO1TYIErm55d0yAhPpMzU5vf13FcbKS4B3nW0m0tDsTFJT/eq+5kKx
	1cuTsE4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvNTq-0000000DFpE-2uVA;
	Thu, 20 Mar 2025 21:31:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvNS9-0000000DFWf-0JzB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 21:29:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E17661132;
	Thu, 20 Mar 2025 21:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4D8C4CEDD;
	Thu, 20 Mar 2025 21:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742506163;
	bh=BfFbmidVd0ga1sTaDOR7P/pNui14jGTWt28A2TXGhGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YhSKAK5h8Q82LHf7Hlg04L+bPGwJDVi54Y44giplGZxoxQE9w11cuLNOoUCnkgfEk
	 vdcSP4uywjHrgTWuILvCl6+rHA5j58bzvHdlIh/PrliLUhGDw81yQipf5SctpAJNIx
	 PyxXoDFWxD76kfcOfKVYaDPrRbtVvPgJYHBp5AVV6/H5qwIdY2o5eQxtU5EA7un32A
	 IWlcR8oAWUw3m6dIanBa9A0E+Jirj8pub+fQkzffZmkKlK5kZ0lvie/0Rb90RdL7ie
	 l0Tx6h3PD1uPJ8i9yscOeY73gfSSYlqw5KKksbLRaEkD91HI9PgvCiW4wI7ScN7iqC
	 v9aMsqsLB804g==
Date: Thu, 20 Mar 2025 22:29:20 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: u.kleine-koenig@baylibre.com, rjui@broadcom.com, sbranden@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: iproc: Refactor prototype and remove redundant
 error checks
Message-ID: <brmzhl77j2lk7bghy5iuzeifar2fdwa6nhhzfywm7xvlidxwjm@3x4cy4f6pxvf>
References: <20250121084818.2719-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250121084818.2719-1-vulab@iscas.ac.cn>
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

Hi Wentao,

...

> @@ -1169,9 +1165,7 @@ static int bcm_iproc_i2c_resume(struct device *dev)
>  	 * Power domain could have been shut off completely in system deep
>  	 * sleep, so re-initialize the block here
>  	 */
> -	ret = bcm_iproc_i2c_init(iproc_i2c);
> -	if (ret)
> -		return ret;
> +	bcm_iproc_i2c_init(iproc_i2c);

This caused a:

   warning: unused variable ‘ret’

Please, make sure next time to compile properly before submitting
patches. For now I fixed the warning and merged your patch to
i2c/i2c-hist.

Thanks,
Andi

>  
>  	/* configure to the desired bus speed */
>  	val = iproc_i2c_rd_reg(iproc_i2c, TIM_CFG_OFFSET);
> -- 
> 2.42.0.windows.2
> 

