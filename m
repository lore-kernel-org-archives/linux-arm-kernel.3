Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE28CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwoDIPqySHCxoAtf53CxPWWZ9nUZ9E6x5thuYUbBCf4=; b=aAfQrY8AoGyP7mqESapTE25qMh
	lTgcRfU+VdWeKTEH3xA/iYq6fVOJTDpc93w2+2DmxVFhTxChlC4d/ODCTwf+GW/nsN3CdYxVQzQN8
	JIRrnHW2TSdR3RISdtjDFChfHs2n8qPxFEMHwljWM+v2HdK185idogCIGCmaSVHa9Gw4RXOZbjq0B
	G2Zzh5Owo19yHiEcYHxp/WWHMeO6WW3G0yOoP16zaUtEmxn4O8e+tjEfHrW3jsYDrwMVG29xxhTcQ
	hEJ5/FPGUPEPshSahLgK1QMrQwG+eq0xITTVCqrnxmBGySj0wIRmchy/FoJn2Jka7Fuh3tWPMAquy
	yoZcKu0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphmQ-00000003zvd-0PrT;
	Sat, 23 Aug 2025 06:31:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSNm-00000002iF4-0Niz;
	Fri, 22 Aug 2025 14:04:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 579ACA583DA;
	Fri, 22 Aug 2025 14:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB16DC4CEED;
	Fri, 22 Aug 2025 14:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755871481;
	bh=lnXfUbhwjwvmKYPmzSa4znMTh2n6CcVoBz5/ntha/kQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OFVLq/5+Ub4dj8tgte5CU3YyS+G3fbUUCVHF/U0fN2r4VHg5Qc2QgGjsZX6ikjnRX
	 rwoJO+kNO+WT2C9Il4VcHqV9qGPlniquUYMxTaYPBFGsMalkVoT4P3yB4me7+FQxJO
	 Ztkhi1ObxOocGbxM/jgyg44dUPONEq78O8ThI7eikBEXCREwhB030j+FXrdPhDYvP1
	 SMASRyL/17cuNSMhyxVz5mBEto4pcz5tDDZEX7yRo9ihT7kpqXFLbITPtTAAqwnOAr
	 7AOUvOW3X9kahbJk6a0IDLbfWFPKxadajkDdF0MhGTvd3hlBjdaUDsRBuLnt9ToNRQ
	 /kIyrUWIcuj/Q==
Date: Fri, 22 Aug 2025 07:04:40 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] net: airoha: Add airoha_ppe_dev struct
 definition
Message-ID: <20250822070440.71bdd804@kernel.org>
In-Reply-To: <aKgVEYMftYgdynxw@lore-rh-laptop>
References: <20250819-airoha-en7581-wlan-rx-offload-v1-0-71a097e0e2a1@kernel.org>
	<20250819-airoha-en7581-wlan-rx-offload-v1-2-71a097e0e2a1@kernel.org>
	<20250821183453.4136c5d3@kernel.org>
	<aKgVEYMftYgdynxw@lore-rh-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_070442_196993_7B8795C8 
X-CRM114-Status: GOOD (  12.10  )
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

On Fri, 22 Aug 2025 08:58:25 +0200 Lorenzo Bianconi wrote:
> > On Tue, 19 Aug 2025 14:21:07 +0200 Lorenzo Bianconi wrote:  
> > > +	pdev = of_find_device_by_node(np);
> > > +  
> > 
> > did you mean to put the of_node_put() here?
> >   
> > > +	if (!pdev) {
> > > +		dev_err(dev, "cannot find device node %s\n", np->name);
> > > +		of_node_put(np);
> > > +		return ERR_PTR(-ENODEV);
> > > +	}
> > > +	of_node_put(np);  
> 
> I moved the of_node_put() here (and in the if branch) in order to fix a similar
> issue fixed by Alok for airoha_npu.

Ah, didn't notice it in the print..
maybe remove the empty line between the of_find_device.. and the null
check on pdev then?

