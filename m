Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C71C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 01:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RuALrCa1fl0g7gnPmhFHGWBMiBMxzjAeqX7STCFkzAs=; b=JyBxtXmjFE0GgQ5ZbaQ1oPI+NZ
	JzjeJNxrgGdZW+U2aoZ4zyHmf8R20RiRlQPcJbt2pgViyZnB6uUfZzMNhxBTuwy1tfppEazqf0/If
	gaSnVd941r0NXiB8veTBUAnLxejoS7h/ddovHbB5PlYb2sk81/6d2g4xre7+E66hbCiQuIPzBu/3k
	bBFOB3ZpkZDW+VcnsFjyn38Gt3L00vb5sTISR52J7oD5H3Tj2JnGqBLarPiKebLj0Ns6Hv+BdGZ7P
	PClk7UHF6ZCV5cpzdnRDCH0d2B1WX2/dDR5T9Va73q5PsSVYj541V+AiOzlnkQ9rmHOrjilsdKFay
	C4Dr0LVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB1SF-00000003MuR-3CjK;
	Sat, 03 May 2025 01:14:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB1QK-00000003MpI-316i;
	Sat, 03 May 2025 01:12:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AE6B061126;
	Sat,  3 May 2025 01:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE6DDC4CEE4;
	Sat,  3 May 2025 01:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746234731;
	bh=UCr5T6K4CJuDDgOx4gvr+YTWhICDbwksYel5Qz0G/ng=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AHFGKKQhpOZXZ/n7SGpLF/QCisoPwAqzpozhOycDocS5gOxf186yPAauYsHGK5biY
	 8FMrsrQ0+stIWdv0B5CLELBHuflTxnuLDNj4vuzYxkKNoSlybhnQ1SwTgxOTkujlZd
	 4P+9tz+d3PAU4xVlSZWglYPuZS1H6oiaqBpDNlOM9RBbtysLef2nYD0MIbo8h0WzhY
	 ERQP6/Bd6/hATAx59HPXWQUOnTk3zxu0dUbDl2FPQRFSrIUotHvJGsA48YgUGcs7iL
	 0m7/LvWt/y4AemE0+mtSFFbFYKAbU79sUWq8jvULjwSo5quMkrpkWvN0bryy87Zf0s
	 lBe8flKVmEJhA==
Date: Fri, 2 May 2025 18:12:10 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, Simon Horman
 <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>
Subject: Re: [PATCH net v4] net: airoha: Add missing filed to ppe_mbox_data
 struct
Message-ID: <20250502181210.75b9d144@kernel.org>
In-Reply-To: <aBRzQaonAK0IyAsu@lore-desk>
References: <20250429-airoha-en7581-fix-ppe_mbox_data-v4-1-d2a8b901dad0@kernel.org>
	<20250501071518.50c92e8c@kernel.org>
	<aBPdyn580lxUMJKz@lore-desk>
	<20250501174140.6dc31b36@kernel.org>
	<aBRzQaonAK0IyAsu@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 2 May 2025 09:24:49 +0200 Lorenzo Bianconi wrote:
> > > What I mean here is the padding in the ppe_mbox_data struct used by the fw running
> > > on the NPU, not in the version used by the airoha_eth driver, got my point?
> > > Sorry, re-reading it, it was not so clear, I agree.  
> > 
> > You mean adding the "u8 rsv[3];" ? that is fine.
> > I don't get why we also need to add the 3 __packed  
> 
> I agree the __packed attributes are not mandatory at the moment, we just agreed
> with Jacob that is fine to add them. Do you prefer to get rid of them?

Yes, they also imply the structure may not be aligned, AFAIU.
__packed used to be one of DaveM's big no-nos back in the day.
Especially in vendor drivers it gets sprinkled everywhere without
thinking. So maybe it's all school of me, but yes, please remove.

