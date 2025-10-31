Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0312ACCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 08:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLI3URYvLaxO53Wa+kwapi10ZqQJBs0bkDd7G25/+N0=; b=1ETc4r+OAuWtcHhlAE4TTdPZhD
	L0HSvJCg8ssiV/vLyIF5FTCh/kg/CTDjWB+RYXIRZ2FloNJzP4WnL7gnnj6vktgCphuCPhQMAx7mH
	9zkTowqnOUm6fqcJWQHG+v751+BrU3KOpT7W4BWCw9Y6wc+hQJsnr3n4DvYeCwGIGZyhHtf76643L
	y2Txocq9cm1OUvyBijAH1diXfjZ6bSES+11NLhhfrmD3SngLIXkadi8jlNkp5Fk6HpeyE5H1W1DvL
	E7ygFm7oAs7qMOc100M70tsCUBoCTn5zC4sgCh4xi/qzVBjUWBoYzI6U+FAKoo9Do8pds1vJuFAub
	uDdtH70g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEksr-00000005hk9-0JZW;
	Fri, 31 Oct 2025 08:53:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkso-00000005hin-2Cxv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 08:53:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE686438E4;
	Fri, 31 Oct 2025 08:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11393C4CEF1;
	Fri, 31 Oct 2025 08:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761900797;
	bh=oK5nbB1LtOV7g02ZprYXgPq8GKEmIM9bcsXX+afO7Kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DYEKqxr2pRl3d4ijIZ5ZZYCcw/en5aFTZ5TcxpfP/QJ/ZgAtoCyBwnXU3e4SfKfTW
	 WIUQWa+Y0SU4tIKw68AHY4F928BIByHXV5FqmoMmT99dz6DbRvpPJozKjMgge7YxxH
	 TjmTg8tIUZvZyr/dlja+uj+/OKCvrbuS2ANl8RXD0vOKF+goo9uuUDr52O1N6T6ciQ
	 q/glR4+532A3FeETTACxSYqblvKYGQEfoNgo89uv/UL1TmYJyBrDHns/tDyk/7cvIq
	 SqxnjErCtLd3Pf0aCARGpwKJ6mWGAVMfTes+Br3yGaakDaY4gK9hgAfh6tJ+pY1u7G
	 HqtI34pitwAOA==
Date: Fri, 31 Oct 2025 09:53:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: weishangjuan@eswincomputing.com
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com, 
	vladimir.oltean@nxp.com, prabhakar.mahadev-lad.rj@bp.renesas.com, jan.petrous@oss.nxp.com, 
	inochiama@gmail.com, jszhang@kernel.org, 0x1207@gmail.com, boon.khai.ng@altera.com, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	robh@kernel.org, linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com, 
	linmin@eswincomputing.com, lizhi2@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: [PATCH] dt-bindings: ethernet: eswin: fix yaml schema issues
Message-ID: <20251031-elated-radical-limpet-6a0eaf@kuoka>
References: <20251030085001.191-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251030085001.191-1-weishangjuan@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_015318_586896_4C7C2825 
X-CRM114-Status: GOOD (  13.69  )
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

On Thu, Oct 30, 2025 at 04:50:01PM +0800, weishangjuan@eswincomputing.com wrote:
> From: Shangjuan Wei <weishangjuan@eswincomputing.com>
> 
> Due to the detection of errors in the eswin mmc module
> regarding the eswin,hsp-sp-csr attributes in the
> eswin,eic7700-eth.yaml file, the link is as follows:
> https://lore.kernel.org/all/176096011380.22917.1988679321096076522.robh@kernel.org/

Drop, reported already says that.

Just say that this is one phandle with multiple arguments, so the syntax
should be in the form of:

> Therefore, the eswin,hsp-sp-csr attributes of the eic7700-eth.yaml file
> regarding eswin and hsp-sp-csr will be changed to the form of:

> items:
>   - items:
>       - description: ...
>       - description: ...
>       - description: ...
>       - description: ...
> 
> The MMC,Ethernet,and USB modules of eswin vendor have defined
> eswin,hsp-sp-csr attribute in YAML. In order to be consistent
> with the property description of MMC,USB, I have modified the
> description content of eswin,hsp-sp-csr attribute in Ethernet YAML.

That's redundant paragraph. Write concise messages describing the
problem, not some background or unrelated bindings. See also submitting
patches about preferred English form.

> 
> Fixes: 888bd0eca93c("dt-bindings: ethernet: eswin: Document for EIC7700 SoC")

Missing space, missing checkpatch.

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

With first paragraph and fixes tag corrected:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


