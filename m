Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A1F606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 09:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1gNtzuQL;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=0UrTyjyV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZuzL8N0vlppJloy/muSuIIAe2Zftz1tlLIt/FEE//g4=; b=1gNtzuQL/E4Jlj
	FhCUAeVOklD6K4NhUMw3ZEmt/sbmpU7g/elRXoPdwfSLqWiLaKBzRiav20+saLOembyUlV6gYQGKn
	JfcGJU+lFxiztaMi1WY3PE+oN2L7AZCnN0ovE342MSDV+cZPzl5dA0mw/dGZpxgjs0/l7IZCge5S1
	NPy4K49qqII3wSX1X5qd2cYr1CyN8gZOHLOjWlB/K2plsjk8NtP4kf6Upesq6TTx0g/mrJq0/LPvI
	VRWUhJC/aelqFdxF7aGXy8Vdqw/mG9ADBt6JMnt7fO3iByt0h3d4kDhK6+qO0f4pVWzLRIGDkPRsk
	esYIW8ICHDrQbybNCQfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjGq-0000000BI6v-1gmW;
	Fri, 30 Oct 2026 09:51:36 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjGm-0000000BI5k-2110
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 09:51:35 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZuzL8N0vlppJloy/muSuIIAe2Zftz1tlLIt/FEE//g4=;
	b=0UrTyjyVBnf6sKptfuORA4gghvLGNMWRrh5UmCN2USUQ+RRTVy20wvL5hedXymwwnx1WLmlT1
	dFk71RHUewofm7xwqA2BFLWPX8QPbMPw3svRB9+d+9tvDuO25irRK8fJMAYE4TiEDBzCQkyGonR
	K+fk3eRBbKlsBllNXL+ivFQ=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jGGZh3FNcz1prM0;
	Fri, 30 Oct 2026 17:51:24 +0800 (CST)
Received: from whupemo200006.china.huawei.com (unknown [7.152.185.252])
	by mail.maildlp.com (Postfix) with ESMTPS id 0A5FF40575;
	Fri, 30 Oct 2026 17:51:26 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 whupemo200006.china.huawei.com (7.152.185.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 30 Oct 2026 17:51:24 +0800
Subject: Re: [PATCH v2] Documentation/process: Add a maintainer entry profile
 for KVM/arm64
To: Matthias Goergens <matthias.goergens@gmail.com>
CC: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Fuad
 Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden
	<seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	<kvmarm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
	<linux-kernel@vger.kernel.org>, <workflows@vger.kernel.org>
References: <20261030083351.3040604-1-matthias.goergens@gmail.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <cc52465a-54b8-12ca-ec5f-fa1aa1c0c55d@huawei.com>
Date: Fri, 30 Oct 2026 17:51:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261030083351.3040604-1-matthias.goergens@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 whupemo200006.china.huawei.com (7.152.185.252)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_025133_166968_65F2D93D 
X-CRM114-Status: GOOD (  18.81  )
X-Spam-Score: -3.3 (---)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Matthias,

On 2026/10/30 16:33, Matthias Goergens wrote:
> KVM/arm64 has no P: entry in MAINTAINERS, so nothing tells a contributor
> that the kvmarm tree is used for integration only, or what the
> maintainers expect patches to be based on.  Marc Zyngier said a profile
> would help.
> 
> Add one covering the trees, the base for patches, the submit checklist,
> key cycle dates and review cadence, and point the KVM/arm64 entry at it.
> 
> Link: https://lore.kernel.org/all/875wzu4vuv.wl-maz@kernel.org/
> Link: https://lore.kernel.org/all/87tsnb2dtq.wl-maz@kernel.org/
> Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
> ---
> Changes since the RFC
> (https://lore.kernel.org/all/20260925085621.562448-1-matthias.goergens@gmail.com/):
> 
> - Point at the MAINTAINERS entry instead of naming maintainers and lists.
> - Describe master, topic branches and shared branches; drop the open
>   questions, which the RFC's Sashiko review had also flagged.
> - Base: prefer -rc1 to -rc3, not kvmarm/next; leave conflicts visible.
> - Subject lines: capital letter after the prefixes.
> - Architecture references: prefer rule identifiers; drop the comparison
>   with KVM x86.
> - Testing: selftests usually at the end of the series, reproducible
>   performance measurements, tests encouraged rather than required for NV.
> - Key cycle dates: no new features after -rc6; how fixes are sent.
> - Review cadence: stability of commit IDs; answering bot reviews.
> - Posted as a new thread, with the documentation maintainers and lists
>   on Cc.
> 
> Steffen, Marc asked you for a short addition on KVM/arm64 on s390 for
> the Trees section.  I've left it out and can add it as a follow-up.
> 
> Oliver, thanks for inviting an updated patch.  Corrections are welcome.
> 
>  .../process/maintainer-kvm-arm64.rst          | 181 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +
>  2 files changed, 183 insertions(+)
>  create mode 100644 Documentation/process/maintainer-kvm-arm64.rst

This looks pretty good. Thanks a lot for your efforts!

Acked-by: Zenghui Yu <yuzenghui@huawei.com>

