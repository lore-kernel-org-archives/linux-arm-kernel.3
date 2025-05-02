Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE193C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 00:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/y67xuL0AHVd2uZi8st+YGnhkFyGmL35J26U12xWTI=; b=TOrYSIJKLg1kSxbqKMaqG/sdcK
	9LSAjeLCaSYImvFEkInx0y1nSpCZrqyyl3IDk/t2zevS/UOxIeUP4Ry2sXfC3j0sigH+jGVCUHGaP
	VdtQcyFh//T8IwCqdWT1BRPHvNqfKMFe9FFUnGPUXc2lVxif+qwm0CJwuaaAbuAm6FwBgl8V9zz5K
	0B47oM0YEaiq4Amzg7xWcDNTSv88Lm0cB8taolSWThrRicQsnuEVGJNGKFx0+OJe+1ElSgGbC4vnB
	vKiYbzhnCW+rxJoW4tzxUH5/m/GobFKkIsBWMXy2g73vcQ7FPGUHFx6Tgnu5iDQjNuaFzaYFaN7/i
	Fj+XC37w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAeVB-00000000Qof-1YZc;
	Fri, 02 May 2025 00:43:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAeTH-00000000QgW-3NJC;
	Fri, 02 May 2025 00:41:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 775D5A4C1AB;
	Fri,  2 May 2025 00:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F62BC4CEE3;
	Fri,  2 May 2025 00:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746146501;
	bh=Ognsc8thM1OpvG3RfPb+lorEGejnWGeUehw3OBBJOsQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=W3neSmoe0A6RvPhFrm5DDot+23ysIe+Qw4C0u0dQyvM+rrKJIbwHHXoB7JSUb5yys
	 1XfPHNnXXrs47n4JzmUxLu16/WENskkX+QYGQ9RG/bLscqtggZ167AG9ysxvJm3kud
	 5/ASYeq8C0CPSScIvN+X8+G6guKfaG2JoXdMFo5rkm/FF6t7qNrot4sFWcBd+lIcGJ
	 EJrSeMKlVCDFoN3qKFDyNBsZaimeErixERpM4AnkAgC0btOaPW6GKpwBd5wcBgIMN2
	 RgPQfi9b/9BZWIinCDwpQV9qLrRrgu5OSxOayMotTSt3Lw5FH/yEpjlD0NVd24B8Y3
	 uBzLrlWMHFHzQ==
Date: Thu, 1 May 2025 17:41:40 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, Simon Horman
 <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>
Subject: Re: [PATCH net v4] net: airoha: Add missing filed to ppe_mbox_data
 struct
Message-ID: <20250501174140.6dc31b36@kernel.org>
In-Reply-To: <aBPdyn580lxUMJKz@lore-desk>
References: <20250429-airoha-en7581-fix-ppe_mbox_data-v4-1-d2a8b901dad0@kernel.org>
	<20250501071518.50c92e8c@kernel.org>
	<aBPdyn580lxUMJKz@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_174143_917020_D066826A 
X-CRM114-Status: GOOD (  11.59  )
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

On Thu, 1 May 2025 22:47:06 +0200 Lorenzo Bianconi wrote:
> On May 01, Jakub Kicinski wrote:
> > On Tue, 29 Apr 2025 16:17:41 +0200 Lorenzo Bianconi wrote:  
> > > Moreover, add __packed attribute to ppe_mbox_data struct definition and
> > > make the fw layout padding explicit in init_info struct.  
> > 
> > Why? everything looks naturally packed now :(  
> 
> What I mean here is the padding in the ppe_mbox_data struct used by the fw running
> on the NPU, not in the version used by the airoha_eth driver, got my point?
> Sorry, re-reading it, it was not so clear, I agree.

You mean adding the "u8 rsv[3];" ? that is fine.
I don't get why we also need to add the 3 __packed

