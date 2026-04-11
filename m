Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917DDF36BA5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 08:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s62NtN7oZTfVYRxpjVMM6kR5sZ7ZAciBy0wUGiUx7+c=; b=zPUZl1pRxzP53fQPJ0+fK9+sD1
	alxtyoK273UXlkLKkURKhlg6079s3k6FJ/Ndc7ZYU4oeKxEzeCXkJZB9R+yca6xdoEv3wGzxTzmSz
	wBHOIi+MnZBDga+VXhD+Wsca2P4Z5h3od4ttw3mMN1xbfHrMiz4ZQr3UY4sKcDbCC26Rb+q/94jcL
	hQ5h/VG9AkLp8CafR690YbFKDkQGeFy/8Voy/v7NZu/luxDiPFmvHtvsM3+id87lYqubxvpOdpUy9
	Rusd5gxUCHAMTzGNOqMh/geKNfk7Nf/vO1pf3wH5gvkekcy3CSK5SimbJ40W15v6ndZCaq0OwsqB7
	0vC9akBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBTu3-0000000DHSc-2nOj;
	Sat, 11 Apr 2026 08:41:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBTu1-0000000DHSJ-0FmL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 08:41:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD79942AC1;
	Sat, 11 Apr 2026 08:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B876C4CEF7;
	Sat, 11 Apr 2026 08:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775896875;
	bh=kBsOxr3eKZCvLYnbyeQwhEckrwKolmqWuaSMv3r69rE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5+eQ3sSpSYIFT37nLZmc0PwcBopPnwQTeTsz+FPR+P+hqhE5l3QX6t5WsGoPu6I9
	 m1Ndn18E9QbRV3Af4FeI/uvAL6O/poM0gBgpOqEnLCmZp3KkP/Uq1+WmB41hhYR16e
	 ic3Vav9zLb01BUObPsASr5ECqnJ6w8Hl+qxilrqls/eFd6kvW6opTq1qS75W1bKeNO
	 OHLHY4K9PQcvCY1rn0URjWc8ZlJ98Ju/HfNtwIPL0PW5R75634hQ0Wr5VpqEFc31B8
	 JxsZyKM/A3/HZYcjF9Z4l0VguPGIJU29iKdV7SQisN9Qc1roV/ywymJrv8cQT3vpLF
	 gh/4IfTZOHC5A==
Date: Sat, 11 Apr 2026 10:41:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [GIT PULL] One more Qualcomm driver update for v7.1
Message-ID: <20260411-adventurous-celadon-flamingo-10b27b@quoll>
References: <20260406132138.2265013-1-andersson@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260406132138.2265013-1-andersson@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_014117_123102_CEE18BD7 
X-CRM114-Status: UNSURE (   9.20  )
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

On Mon, Apr 06, 2026 at 08:21:38AM -0500, Bjorn Andersson wrote:
> 
> The following changes since commit d6e766e391ef0b2be62682e007223fc72ba7764f:
> 
>   Merge branch '20260125-iris-ubwc-v4-1-1ff30644ac81@oss.qualcomm.com' into drivers-for-7.1 (2026-03-30 12:46:14 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-7.1-2
> 
> for you to fetch changes up to a31ad9339eff4ce401dec816b01a94b4e3c47898:
> 
>   firmware: qcom: scm: Allow QSEECOM on Lenovo IdeaCentre Mini X (2026-04-02 16:09:01 -0500)
> 
> ----------------------------------------------------------------
> One more Qualcomm driver update for v7.1
> 
> Flag Lenovo IdeaCentre Mini X to have functional QSEECOM/uefisecapp.
> 

Thanks, applied

Best regards,
Krzysztof


