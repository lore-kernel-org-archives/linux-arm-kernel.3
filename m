Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D03DCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 19:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9a0SMkSfHUNTNvr1ftlH6X3IHP1fEtjtfsq2G98gVcc=; b=YP13iNp27P9bHi6um3H8ll7pwc
	itMWoIeqkNyTOKXME/j3TAQbUnGrK55q93NwWhI/wC9/Ay/Wu+qEGTF/hlVStkZFyRolwfY1HFEI9
	UpcOtxe83ubOYTsbWQolVOvib7UvgafHl/bLYnV7jP5SyhmVGudmz7ClRC2rsGnbnoha3biGg6nti
	YNhAskoblwu21BCXwqsr4pFAcgxFMWg6GuF0dilWmtw0AZXuaUoyhi8TE9TnAQmnx0QKYORZ2nc4a
	7lgATfoko0lBKBHuoptiaAQlmF+qpH28629k8S5mQym1R7Z9iy6KRrTwHTEybaAvlK7fQkykYV7C5
	BeLGhUBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlKu-00000009yJm-3y96;
	Thu, 11 Jun 2026 19:45:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlKu-00000009yJC-1Qj5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 19:45:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AA6B8402BC;
	Thu, 11 Jun 2026 19:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E021F00A3A;
	Thu, 11 Jun 2026 19:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781207107;
	bh=9a0SMkSfHUNTNvr1ftlH6X3IHP1fEtjtfsq2G98gVcc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=HEyMdzOkqvfYpdlVynMSxr60vo4FtJqKv3cSjacdLoM/WKd37tPY+oTwRh3hABg+X
	 4DmE2knYx10skQt6hgabMskl1FFWuhGhXtXhe0XpML805CEDFjlTDlYJTgKjy+Ba+3
	 ptLUN150tgNW3RD0GKZg3b1+k1FaG/YBe9xN8tBh2DRkbJlLA93sE8cGd8XgoLlZ1n
	 Te+JiScXWSvzF6r2F+wsxw4yYzn3TmSg94UG31v/K/BvWxO/pMWCVPa9QO8jEWrq5s
	 ABqcYAieOm2il05MXtWFIXJHivOW+ueS8uHSKDno5a8Vky8qHtWqSgUv1U+uwd33PH
	 b4TGY7eQGdssA==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8C559F40074;
	Thu, 11 Jun 2026 15:45:06 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 11 Jun 2026 15:45:06 -0400
X-ME-Sender: <xms:QhArauT_XORPZQJTyWXJvXazZXH64vikBYAouHNqg-2OH8PdFvftxA>
    <xme:QhArapUrYxtM4EblKHzdWDE1w5Nylxwo_nmHMv4Kyd0EK0vhOmy4JUpH-f5BtE9z2
    Raqedl3oybuOn0nPGpdvW-KR5LMKYBu6q4QRv9U_2abVlUJhplw6AY>
X-ME-Received: <xmr:QhAralb0Djr-tMHKM44b994W0tIJcW4Q2tN3oJ2Q3tzj1CPuKBaXqc06GdQnXhKDaZYmlEkoBQodxhPuFusap9WTmLL4GpFMIxM>
X-ME-Proxy-Cause: dmFkZTECBux9In0mEU9Au6vS4FNBdtvHVz/tllZbDvTycM4hXMN9CVUaaBaCIVRt5YM1oS
    pRew6NN2qH7ImIJ5Wb05SRFSk28NsXHOGrQTXw84upkzwXl8CqB3ZOKoq/Kx9cYEBglm3w
    BbUrrCmtibzG/Lx9h6QKU0SY91myEPjYwF9xOXA7L2M8c+A59qHqD/VaYg+bvy8mWSqNwc
    M9emOR+vkWFrDAHaeV7jLY+9Z0vsQzJqqJnefUlVZ2XbNnwgio9TDclRg9cfrKK1ar8zbK
    0azGtHOtYqhsYc9srmJpQgjAXz4tobNTKCMblCkWoA7Ye7nUaKCFAT9dvTNawqfOfcgMgT
    n0V966t/vWGGs0Lw7BKLMmGaDbXz4sEHLKOjib7OFPEDmo29EYffc74FjTof71EuKBFlM1
    3qa82npD24vYiH+tSg8rhBa04MOYPN0pH5KWOZ9Fu693nge6qPlclv5t2CWbNqFOnnsuUZ
    1pFHwtaXsDF0VZg+NRNLLIwSc/obV4amq0eCVQhkJGkZAjFSPXxxRqZqDyec7Ndp3yTuL5
    xV+TOTby38nfp2jMCZDDlxlcPedmx73PC8Uvzo4eaw/uRilHRHkJj+facaynr95wgTtnQc
    M49FkNzeqzcQrl/FO0i1o2lEwRP0FPFFhSOMReF+CY92OjXsr91GvzOUBlUw
X-ME-Proxy: <xmx:QhAraq6KsdoZP4NoRjDNugptzew59m2Tqgi9wlXeqnFVeUpgShLPpQ>
    <xmx:QhAraux7lNJ9YgaLEhAZbiX0C5wVPqRiRiM0so5mjM1wxdhb3A6_fw>
    <xmx:QhArajoXhceO78AVFbxtGlIIgfSpqsQhXkNaG94z16Td0ExOaBD6fw>
    <xmx:QhArao09AAxXtStCUZkADFiJ5PxwdAgFG4hxAYgqz8mjHzvv-H33pQ>
    <xmx:QhArakBhm5NrsWWOFm5QXhFRdiqW4XJiTyP71TrtfsIGSAxHarIfgQuJ>
Feedback-ID: i67ae4b3e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Jun 2026 15:45:04 -0400 (EDT)
Date: Thu, 11 Jun 2026 12:45:01 -0700
From: "Dan Williams (nvidia)" <djbw@kernel.org>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, 
 linux-coco@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Greg KH <gregkh@linuxfoundation.org>, 
 Jeremy Linton <jeremy.linton@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Will Deacon <will@kernel.org>, 
 Steven Price <steven.price@arm.com>, 
 Suzuki K Poulose <Suzuki.Poulose@arm.com>, 
 Andre Przywara <andre.przywara@arm.com>
Message-ID: <6a2b103d77596_344af1000@djbw-dev.notmuch>
In-Reply-To: <20260611130429.295516-7-aneesh.kumar@kernel.org>
References: <20260611130429.295516-1-aneesh.kumar@kernel.org>
 <20260611130429.295516-7-aneesh.kumar@kernel.org>
Subject: Re: [PATCH v7 6/6] coco: guest: arm64: Replace dummy CCA device with
 sysfs ABI
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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

Aneesh Kumar K.V (Arm) wrote:
> The SMCCC firmware driver now creates the arm-smccc platform device and
> instantiates the CCA RSI auxiliary devices once the RSI ABI is discovered.
> The arm64-specific arm-cca-dev platform device stub is therefore no longer
> needed.
> 
> However, userspace has used the arm-cca-dev platform device to detect Arm
> CCA Realm guests [1]. Removing it without a replacement would break that
> detection and would also leave userspace depending on kernel device-model
> details.
> 
> Add /sys/firmware/cca/realm_guest as a stable, architecture-provided ABI
> for detecting whether the kernel is running as an Arm CCA Realm guest. The
> file returns 1 in Realm world and 0 otherwise, similar to the existing s390
> /sys/firmware/uv/prot_virt_guest interface for protected virtualization
> guests.
> 
> Remove the dummy arm-cca-dev registration now that userspace has a
> dedicated CCA Realm guest indicator, and document the new ABI in
> Documentation/ABI/testing/sysfs-firmware-cca.

I would have expected an attribute in /sys/class/tsm/tsmX to be the
common protected guest indicator. Then, if you need to distinguish the
architecture that registered that tsm it would be in the name of the
parent device for the tsm class device. 

That also gives you the property that a uevent has signalled the arrival
of tsm guest services. Otherwise, userspace still needs some custom
device-model details to know when it can start issuing tsm requests.

Is auxilliary device arrival too late in the flow for what systemd
needs?

