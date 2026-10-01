Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF606CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jRLHhR2W/8VdRkQx6s/u8EG98t23x3ILhs/TN4rQR4=; b=Jdf5XCceETm0o0D4WmZ+Sa5gma
	Az1eGgdgEYwXabAMRRIIneh6Zk8XHtsIQ7rBNJKl8vkOeVmjPG2/1ZXopjwXB0VJV26hMelwe1Klq
	ll7Gu8lZ+CsdZresOlMzeo1qFuSf3YaN8tDGikP7z2/vom7tPPqxU6LWA+6nFu4LWIwuUzTEncUuB
	FdHeSgfgXWO9oj80cUrh0tzijSAnpQVbPFJfhSjsceM16392tdVAZMXT842PhWRBGTIXKLxybOX5t
	DLbWFVKf9KYamhLlwGyiYMzWQW2QTHzBotVjpVEMIWs/LXGD9K8RRCIcQ1lZEWx+G3KUa8GPyfJrU
	il/wU/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFkE-000000092r6-119I;
	Thu, 01 Oct 2026 12:18:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFkD-000000092qw-18qs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:18:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7AFE660A55;
	Thu,  1 Oct 2026 12:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 043C01F000FF;
	Thu,  1 Oct 2026 12:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790857116;
	bh=5jRLHhR2W/8VdRkQx6s/u8EG98t23x3ILhs/TN4rQR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a9fRWT6UdSEXG+t/3iyGsbl5Vb/eEBlFFn9eWdvVby+V4l9fNdQplYf8WyNQcf3Zj
	 Kh+iay3pmu5Dh3UTrd3eY2UOejJDK4DlTk3wjM1tN4eoywJvX4lK4UwQdbcjHiJB2e
	 pKkyeCZgE8RQx/tUeRAWoKE2s9GeWFnNaHyg8qCcR01iZIKhjiQ5AhKdr+OfFy3+z2
	 ijkxwQ6bXcxAQVKjk2VE9htG83+Qm+KiG9DkcmXpUPQBTwGt4GN0Hby0KDHoa/pafi
	 PMiX71vzyYv7fGI2f7vVum2EjnHOHhJnvnbphaVT2ZJ+lNNV7h+aEqU8SNlvtol+op
	 XrDarLNLua5NA==
Date: Thu, 1 Oct 2026 14:18:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: SoC Team <soc@lists.linux.dev>, 
	ALKML <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [GIT PULL] arm64: dts: fvp/juno: Updates for v7.4
Message-ID: <20261001-merciful-starling-of-opposition-cc43e3@quoll>
References: <20260928065048.2492112-1-sudeep.holla@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260928065048.2492112-1-sudeep.holla@kernel.org>
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

On Mon, Sep 28, 2026 at 07:50:47AM +0100, Sudeep Holla wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> -->8
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-updates-7.4
> 
> for you to fetch changes up to d8e88ad6f769ec55d3d8510dc53c2b08ddfea645:
> 
>   arm64: dts: fvp: Add additional PCIe memory region (2026-09-16 09:20:29 +0100)
> 
> ----------------------------------------------------------------

Thanks, applied

Best regards,
Krzysztof


