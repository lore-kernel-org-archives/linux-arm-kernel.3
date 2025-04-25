Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B96C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 00:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZT1jPcvqOA/bCwaES44yzXZx238UekkKye3BQb4DP5E=; b=w59uxFk5EI+tEfX3UT3qqjTDmn
	VNKIn+4Vd/c98tEOH5HiNTGNljIFrAH3U/H2nq+t4NzL7CySzHO1z/6RO48cUo6JKfCyTaN9k2/Ni
	PSLamcjzxh7s7dMf+7noi8imvWQjY17KSFEBz90urxhgg4wVInNu3Dgs7XQfOrLV+5vzPbjZu4W0m
	vWF3BG8+lrpp0zkPBlTd9Zcj3DfXbd+E92DvzEiTHRQWD4ibGy95vSDu7QSYlsf1vSBnmvD5w/jMu
	FM7WXy1NBRVXw9VNGb2VqfopXUKo4BVRj4uRnCq1lUrvHP2F8d7ojy77k3O7tCkWwiLrFNtD58ZHR
	i31ieXMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u86f7-0000000Fav3-0XzU;
	Fri, 25 Apr 2025 00:11:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u86dI-0000000Fald-14RX;
	Fri, 25 Apr 2025 00:09:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E9BC6845E;
	Fri, 25 Apr 2025 00:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C951AC4CEE3;
	Fri, 25 Apr 2025 00:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745539771;
	bh=X27dZXbBf1UyTh3wlr1veO6Mj5ruoi4P1bv5CB1QzcE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RQqKDjKiwOzHkH5YWJteDczIvLI7JWjNDaSlgbSp2xjrWlVs3wKE5/q//I6dz3yvY
	 gnFIU3wLzuJFFileOJ4nbtcMkAuVHtH+LecSU7UqZuZCA+K9wRA0zXWA38wB3c0AwH
	 cnaevBn7myWAiQxyB4G9Rk8mgGjD+Prl1asQvbWxSSrjaJXpw7OFYC6VDRPNEm62+9
	 ns4KP5gxxqpp9ieOuYVUgoAZaTrOj3EMORvAjQ9H4Gmu1AUY1G+9aTztV4ZLaWHxUp
	 0QiJKQWLs2ZPxaYB6/dBLYh/h27VxD/rMaLC/IwVBHTvOoK03zm80rHcC91WKNTApI
	 Tj2M4uTp2F7Ag==
Date: Thu, 24 Apr 2025 17:09:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <netdev@vger.kernel.org>, Simon
 Horman <horms@kernel.org>
Subject: Re: [PATCH net v3] net: airoha: Add missing filed to ppe_mbox_data
 struct
Message-ID: <20250424170929.3fb25bb8@kernel.org>
In-Reply-To: <b3ad22c0-bc58-41e5-8d62-a3bc8d7dccbe@intel.com>
References: <20250422-airoha-en7581-fix-ppe_mbox_data-v3-1-87dd50d2956e@kernel.org>
	<c34ef8a0-20fd-4d0b-84cc-8f829f4be675@intel.com>
	<aAjNC7zUrhc2Ma0z@lore-desk>
	<b3ad22c0-bc58-41e5-8d62-a3bc8d7dccbe@intel.com>
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

On Wed, 23 Apr 2025 09:34:49 -0700 Jacob Keller wrote:
> >> One oddity here is that the structure is not marked __packed. This
> >> addition of a u8 means there will be a 3-byte gap on platforms which
> >> have a 4-byte integer... It feels very weird these are ints and not s32
> >> or something to fully clarify the sizes.  
> > 
> > yes, you are right. Let's hold on for a while with this patch and let me ask
> > Airoha folks if we can "pack" the struct in the NPU firmware binary so we can use
> > __packed attribute here. In any case I will use "u32" instead of "int" in the next
> > version.  
> 
> Sure. Also, if firmware already has this layout fixed, you could add the
> 3 padding bytes marked as reserved to make it more obvious they exist
> without needing to remember the rules for how the members will align.

+1 FWIW, mark the padding explicitly is good, but don't make everything
misaligned with __packed

