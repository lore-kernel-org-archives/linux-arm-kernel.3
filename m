Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB97DCA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 09:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qyJA/7nwl3OSaIXJDB1WKzr1+yP75suMFvmwmo2iG1M=; b=eC27arj/EWGF0nfeDgGNt54Pza
	zfN8FTbGeRe3dkn9eju+9lOPY9xLpkEuvP9RR9hIl2Bvdgv5gVMJm6e5cc8eYNXZVLwve8TBulIz8
	tr3yk4t067so0D9fyF621jFVeNwU+xv874c45AUR0w4V8AP4UWH6T4JSzUySVBSHowyk8nH88KJuM
	NxYH0CHjs7rzgoPfXxcfSnzqfNwX3AdaCDrM9caXn+xVslJLHi62qjT6Ba6PwJ+LJ4M7P9gwpXsxk
	vi8ed+mWeC2veQ/HNbRxjoEr2fpFOwmn7oaUh94upuAt3+tDeHKuJ7Wh6X+45LDkTKKsueT8rib3n
	pMb9lcBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6uu-00000005vCJ-0i1K;
	Fri, 09 Oct 2026 09:29:28 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6ur-00000005vBZ-0Jeo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 09:29:26 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id AD14D240106
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Oct 2026 11:29:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1791538160;
	bh=qyJA/7nwl3OSaIXJDB1WKzr1+yP75suMFvmwmo2iG1M=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Transfer-Encoding:From;
	b=V2mv9vpd2gCnzjevmVssg0dfsMqWV4aLhz5lNQwSzH+CkftEuG7xkvAd5eci3ZYN1
	 oEURgfs+ZBymS2YD6zCvbuglQjijOcNY2YETg+2LWjWhYf+TM7bxc5ReJdBMZYLtZe
	 k0AS+Sah6FhyqrDKbS7nffRK5TLk7RL8pE7Cj46bFm9lBges20A+aeEQ6N5AcPBN/T
	 neMWBpY2JI3/T/U6Ct5lzxcAgdpc/Z0iG726GZTX1LIsyfDioVCxbRWyu6Gu3gDylJ
	 nQfNL9cBSBhXEOiX7AClwiWR98tBtQ+bS5192KhFInuN5T+4E32eTL0gZsZPyPJGUb
	 4Fm5nvNxc6oWQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4j1M4t6pvBz6v13;
	Fri,  9 Oct 2026 11:29:18 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 09 Oct 2026 09:29:20 +0000
From: mateusz.nowicki@posteo.net
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: st: mark main supplies always-on on
 stm32mp257f-dk
In-Reply-To: <2b17d398-0581-4b15-8c3e-dd87883667c9@foss.st.com>
References: <20261004112421.47158-1-mateusz.nowicki@posteo.net>
 <aaedc962-63ab-431b-8b27-b4ac9c11d16e@foss.st.com>
 <1baaa8cb024104ee6d201d55467f6718@posteo.net>
 <2b17d398-0581-4b15-8c3e-dd87883667c9@foss.st.com>
Message-ID: <d5f43cb2615f5968eba98129356935fd@posteo.net>
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_022925_274435_393BCB0F 
X-CRM114-Status: UNSURE (   6.38  )
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

Hi Patrick,

On 09.10.2026 10:17, Patrick DELAUNAY wrote:
> At this stage, we can probably live with that, no need to specific
> treatment for v1v8 and v3v3 and you can drop the patch.

Thanks for the detailed explanation, that clears it up. I'll drop
the patch.

Thanks,
Mateusz

