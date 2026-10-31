Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17B0606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 21:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xEuFVsIH;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bSkmaaid
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=piub7Jp3Cm0dildjXbw9IOWYUttRHS+jgsIN+7iJt8Q=; b=xEuFVsIHR7U0uCkBnW3lKZvp5E
	JzCp6SNVA5XG26E1bogDw83d3eA7t4W9KULMGSSlBxv79VPhZFher5v5OplmDxNXOhzablj62yxXd
	Mau8PW9PXTeHwTZxoVBVxznZoq2NAb9kjUgxkb9yra4gAfdiXE/+X+/P3s1HxkSy9YDReoduE18MP
	L5hJZSClETmcqvjLcaKKfcDCdjj/m2uZ+GLVA+jO44Y8Sk/gBV6IMtxyHp9rxFPxNHO/TBNA2T5zz
	z3kNWDGITPEVEmsq5VZpVTOiaB4yOOoHLgV2eRQixjr1BMdvr1KBgMhjmk7N8DLl9lqfJT2uSkKH9
	3+7kE2Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNGEn-0000000Dgxr-2rQK;
	Sat, 31 Oct 2026 21:03:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNGEk-0000000DgxU-1E8z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 21:03:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E7151576;
	Sat, 31 Oct 2026 14:03:31 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C96D3F673;
	Sat, 31 Oct 2026 14:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793480614; bh=X15v248WCrjIN9447mjAtpg0bDk6UpQdgiQ7F2EU17w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bSkmaaiddT7s+KcKDc0Xx/M0zrWzbr+f2iIijNOn5Mb1EUh4/9YVYYH8LAmEbjqaw
	 xkYgkjfiF9GVDkCXkuJ8ypTpFyzLJEdKLTlLtbv2cVEgIBvYIzKaSKF05t/OwZgHR6
	 267xhQnmeZ77CiCWBkwao/m9EGfYxOEpa59jypy0=
Date: Sat, 31 Oct 2026 21:03:17 +0000
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Matthias Goergens <matthias.goergens@gmail.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Subject: Re: [PATCH v2] Documentation/process: Add a maintainer entry profile
 for KVM/arm64
Message-ID: <6urqt376s23fcyr5pchfrrowvjoo6acg5xt4ujkft7gww6sagj@jxz5rqihtkja>
References: <20261030083351.3040604-1-matthias.goergens@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030083351.3040604-1-matthias.goergens@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_140338_460365_F1144B69 
X-CRM114-Status: GOOD (  18.73  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 04:33:51PM +0800, Matthias Goergens wrote:

[...]

> +Review Cadence
> +--------------
> +
> +Unless the maintainers ask for a new version sooner, allow at least a week
> +between versions of a series, and only post a new version once there has
> +been enough review to justify it.  Posting more often delays review rather
> +than speeding it up.
> +
> +Pinging a series that has had no response is fine.
> +
> +Answer reviews from bots such as Sashiko as you would any other review, even
> +if only to say that a finding is wrong.  Pre-existing problems that a bot
> +points out, and that are unrelated to the series, need not be fixed in its
> +initial posting.
> +
> +Applied patches are normally acknowledged in reply to the posting, naming the
> +branch (``next`` or ``fixes``) and the commits.  The maintainers try not to
> +change the commit IDs of applied patches, but the IDs of merge commits almost
> +always change.
> +
> +Minor problems are often fixed up by the maintainers when applying; if they
> +say "no need to resend", don't.

The second half of this is a little silly :P
What about just:

Minor problems are often fixed up by the maintainers when applying; ask
if you are unsure whether to resend.

Thanks,
Wei-Lin Chang

> +
> +Security issues
> +---------------
> +
> +Bugs that let a guest attack its host, or a nested guest attack its guest
> +hypervisor, should be reported as described in
> +Documentation/process/security-bugs.rst.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7a162e9..183bf34 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14596,7 +14596,9 @@ R:	Zenghui Yu <yuzenghui@huawei.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	kvmarm@lists.linux.dev
>  S:	Maintained
> +P:	Documentation/process/maintainer-kvm-arm64.rst
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git
> +F:	Documentation/process/maintainer-kvm-arm64.rst
>  F:	Documentation/virt/kvm/arm/
>  F:	Documentation/virt/kvm/devices/arm*
>  F:	arch/arm64/include/asm/kvm*
> 
> base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
> -- 
> 2.56.0
> 

