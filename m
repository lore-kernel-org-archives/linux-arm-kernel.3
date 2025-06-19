Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4B5C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUki1f69ZB7z51hjhXHroMgZC6fPcJeEWeMLsot+fEc=; b=Ga387iUlhXAw0fgzJ46Aomv9do
	K6OMIZgsymZx8NIiOOcHv1SbySWk9MKKVlhrcGw+263USjBrR8mcorqb1ymg9udO54PqTYpBVHoY1
	fdV1cpuSMDO/iuwFeqQNkSpvQB0SjIuyutS4rS2Jf9WrBo8KxX+5ymPBmmwde61Ukq+j5KEGnwmqa
	QyXOqsc0sUUqZrKpT7SJJvpgPGvdUFCYMrX2RXaflFUfU9/AwrdlVfVaAwd15ZZkW9tfPHL2b1fbd
	dE0vDfRE0AdV4t2CIFkALz3jGJSizaeGM4f9YOZaH5beZF5qjEejG8AZt7qCoWg71Hn1T4VOsk5zi
	y5SneVnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIeY-0000000DegX-0lkn;
	Thu, 19 Jun 2025 17:02:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDZl-0000000CuYV-0ijN
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Jun 2025 11:37:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vUki1f69ZB7z51hjhXHroMgZC6fPcJeEWeMLsot+fEc=; b=I0TdNcgtbCYo1n5cEVEs9s83Da
	bqoiwv02ipuvvxPqNT6cR0+5z74djCGJcb5JZ5NbH2LqM0+f2Lhj66hxW9AWXBSff70OMy/Znbm2J
	a3cAUeahkKOm6DITTQ2PM4FpQWEzZOOjil+VBvtPEyJXZu+en3xFg0CPf6titmqTbUm5Nb3srej0N
	WFkqi6tkDSZAVxIaySOJHONthho2lGDYWhigv8+BgQeojoCh1l0EeMruBhu7qTmjF+GKXEK933Dac
	ix7xztKYDlDu3VrnSbj6K7PWtQeTj4qxgsm2v9Od6/T8s9CD52rReCstPrwm3qF6sfKuyH+pj6mXH
	o8J1FzYg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDZi-00000004Qvz-35An
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 11:37:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 945045C5F50;
	Thu, 19 Jun 2025 11:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D254DC4CEF0;
	Thu, 19 Jun 2025 11:36:51 +0000 (UTC)
Date: Thu, 19 Jun 2025 12:36:49 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
Cc: ryan.roberts@arm.com, yang@os.amperecomputing.com, will@kernel.org,
	jean-philippe@linaro.org, robin.murphy@arm.com, joro@8bytes.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	james.morse@arm.com, broonie@kernel.org, ardb@kernel.org,
	baohua@kernel.org, suzuki.poulose@arm.com, david@redhat.com,
	jgg@ziepe.ca, nicolinc@nvidia.com, jsnitsel@redhat.com,
	mshavit@google.com, kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v7 3/4] iommu/arm: Add BBM Level 2 smmu feature
Message-ID: <aFP2UXFNoLiLUpo8@arm.com>
References: <20250617095104.6772-1-miko.lenczewski@arm.com>
 <20250617095104.6772-4-miko.lenczewski@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250617095104.6772-4-miko.lenczewski@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_123659_007133_63792AC3 
X-CRM114-Status: UNSURE (   9.01  )
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

On Tue, Jun 17, 2025 at 09:51:03AM +0000, Mikołaj Lenczewski wrote:
> For supporting BBM Level 2 for userspace mappings, we want to ensure
> that the smmu also supports its own version of BBM Level 2. Luckily, the
> smmu spec (IHI 0070G 3.21.1.3) is stricter than the aarch64 spec (DDI
> 0487K.a D8.16.2), so already guarantees that no aborts are raised when
> BBM level 2 is claimed.
> 
> Add the feature and testing for it under arm_smmu_sva_supported().
> 
> Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

