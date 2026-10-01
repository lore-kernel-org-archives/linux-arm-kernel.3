Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F150BCA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDLuOxpMp7Tdhi5/vJ+Q0ikK/izUZmE6ibWwQcZ3I9Y=; b=Lq7ZZN6aQtTZI/LVUpsjwEirp1
	qGegVVCuIb1OUOcWe1R5lBx7NSbmZGWhnJnwiLx2XHd5Ejncvcxcl67yK5DyXS9NDLnXzrQAKPaq5
	2WEmsvo+JlLiSQBqFo1MueVXGVQjNyVVUB+8n0m5x2bpJgH0t9sIxvQn70Q7wgLPimVvA53k+mDzq
	bTzKGfEyCKbRbYpk1pgAG3hYWhL/R0IXvR0X9QzUfwpLmN92qiwduPuhPjkgzIsrC/Ux0D9HWNKfS
	ii8PqthjFHY8P+pnxen8SwK4mx5JSNRBOM9BGd7n1wNZcPnysPjLxGfBvJg04sLihwoGLKxFU4Y1t
	to59CfoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGa8-00000009BYt-2ctt;
	Thu, 01 Oct 2026 13:12:16 +0000
Received: from out-101.mta1.migadu.com ([95.215.58.101] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGa5-00000009BX9-2jE8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:12:15 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=B1MeEhDRbJ1+eBXmdpTqqYccTAe1bu1lIrhcKUuTIqA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790860331; v=1; x=1791465131;
 b=rVAlHH1Sf7fwpXs2ewkQojlzEbSq2xsAOlxQq3LX56WqE/dVOzkW40MIm84+D9lIOE87Nm5Y
 VkR7kMHMz4Ha4Hof9tgdR/89Eahr8e/RGy9zAdmmcyxjIkdDCCISjY/+dLoJLS12P96qtiyBrZ3
 03CZ7O9buYeqMKhXqzmPec5g=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2c553e1406d00f5d;
	Thu, 01 Oct 2026 13:12:11 +0000
X-Mizu-Trace-ID: 2c553e1406d00f5d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5ba4065fa07so7594e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 06:12:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzjIt4VCYijJd7Rw5vwmm+yv0jp1JXVqMB2DvYlUdlnEdENG0kqVmRcJpIitQQ6paS/NW6Ow3+xdLSceH2zaZaw@lists.infradead.org
X-Gm-Message-State: AFq9FYJY0Err/AsPG8kjRia/uru/fo1zX8wfWK3NACAFf9AYJllN8utP
	DXWvbVREkZR7lHOn6bs18X9TQySozg+C2RmT5ZmmQBTSrQIxJfs/7wX5NQ5xz3ZsvvZRN38EejX
	+aDAZv4nM6aobcoTnzc1z2LdheTpaig2MfH/Knwkl
X-Received: by 2002:a05:6512:b8b:b0:5b4:74e2:4171 with SMTP id
 2adb3069b0e04-5ba43819ed1mr170584e87.4.1790860325842; Thu, 01 Oct 2026
 06:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260914113338.159227-1-fuad.tabba@linux.dev> <20260914113338.159227-11-fuad.tabba@linux.dev>
 <ar5ZLxL6-mz98tpN@willie-the-truck>
In-Reply-To: <ar5ZLxL6-mz98tpN@willie-the-truck>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 1 Oct 2026 14:11:29 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzJTpJikYuV-tYYoHbKU+E3UO3ORSdbogx0K+s+E6mofQ@mail.gmail.com>
X-Gm-Features: AclHuK-BYP5-ESF0Lkngn2s3wyk7cTX09ixjLrcRsslFsyjwg-j-q23Rg_ftXRs
Message-ID: <CA+EHjTzJTpJikYuV-tYYoHbKU+E3UO3ORSdbogx0K+s+E6mofQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/18] KVM: arm64: Handle PSCI calls for protected VMs
 at EL2
To: Will Deacon <will@kernel.org>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, joey.gouly@arm.com, seiden@linux.ibm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com, 
	steven.price@arm.com, vdonnefort@google.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_061213_988652_45524DCC 
X-CRM114-Status: GOOD (  10.51  )
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

On Thu, 01 Oct 2026 13:59:27 +0100, Will Deacon <will@kernel.org> wrote:
[...]
> > +    if (prev != PSCI_0_2_AFFINITY_LEVEL_ON_PENDING) {
> > +        /* The only other writer of ON_PENDING is the rollback. */
> > +        WARN_ON(prev != PSCI_0_2_AFFINITY_LEVEL_OFF);
>
> If you go with the idea we're discussing later in the thread, then I think
> you need to drop this WARN_ON() and the comment that goes with it.

Will do, both go in v4.


/fuad

