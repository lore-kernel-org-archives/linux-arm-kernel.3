Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6261CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mDfSs34OiAojyB51FS4AI6mlAji/ZEyurJ6sInGpjXY=; b=Kulw0140tj3rl/IEQiMBpTXKeq
	g+LxC44w2fzbsqoyaKX4qLQVxP2dT8rzxItaAISyTVH2vwx3DhJAQecuCF9isjFUbTuZHAC7GY/VK
	pEySsxRB9lhK0W+yMu4FkE9h448LRUH1/LJsjvQAQLshEQOQz7S/WBEGMLXcEXIl1t9hLVFEAVawx
	f+5u9i/m8QI4IWp+byFIxINuca0/Bbm65F6q//scG9LHyE0Qm1IQs1PFJ38R9vfew1QqnHClrirqF
	FMY8CmIPL7turiTe3U0weBsiT3CPpc3DXAfypmGWGpyPGo56uQKVHxD22VJNfcmFBerGPiFvcsguf
	sTYwTmNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwd2-00000006awW-0h3A;
	Wed, 30 Sep 2026 15:53:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwd0-00000006aw6-1cja
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 15:53:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mDfSs34OiAojyB51FS4AI6mlAji/ZEyurJ6sInGpjXY=; b=BZKnA0VcCQcpN7z4Ghu44D/n0j
	bpp0WJaJMI0/aN7CKQyjnSifoI2BFayA1nhGdwn30ONbNC7OoMgD72/59lhVqp6CxoA4d7klcmFJq
	NO+JHvA4XkR+CvoxJPM/1Jz266rpz7G51G2eZLyYFhXDJjQZxkf0+e6YCeBviGc7EfbrwCU5rwzMn
	xpN49JUVwS7RUbulKrvHUBlu4c92eA5YCG0MsrUUs+z0LDulxI9HfamFNX1qGhAnl9XKuGn+fwwjL
	/0Da5On2li68JxyCwF0C5dpdNf4t2UqX7/LObKnFtml1xIvrb+fDlGsL5VZ8yDmwaLMptiJQwBiac
	YGrRt3AQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBwcw-000000041yb-11DR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:53:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1B8D497;
	Wed, 30 Sep 2026 08:53:45 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 322A23F86F;
	Wed, 30 Sep 2026 08:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790783629; bh=GeZT3eDs8g2P03kaTo/dM1gVfvnN9UUrvbID96/B/Cw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R8pMXVb03CZpqC51umSjYoF0JRCkg7SOK9oalIrlA119QlD+2d4wVuJONjxlgRJaJ
	 n4vv+XKAMK1X4GFrq4+WvDkgb4sk3WIsVq+Bh2Vg5L3yPhifAaQZWmBWE5/sLwFw8b
	 Pa5vscKHSQFYjFFgjJEMkkchUHxoLe82JXko2qOY=
Date: Wed, 30 Sep 2026 16:53:36 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
	sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com,
	David Hildenbrand <david@kernel.org>
Subject: Re: [PATCH v20 9/9] firmware: arm_rmm: hotplug: Skip memory added to
 ZONE_MOVABLE
Message-ID: <ar0wYuWxO6Ow4n6n@arm.com>
References: <20260929221623.1342076-1-suzuki.poulose@arm.com>
 <20260929221623.1342076-10-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929221623.1342076-10-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_165351_613251_7CDAEC42 
X-CRM114-Status: GOOD (  10.83  )
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

On Tue, Sep 29, 2026 at 11:16:23PM +0100, Suzuki K Poulose wrote:
> If the hotadded memory is in ZONE_MOVABLE, we could allow that to proceed
> without the RMM having fine grained tracking, as we won't allocate pages
> from there for guest-memfd or kernel allocation
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

With David's suggestion:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

