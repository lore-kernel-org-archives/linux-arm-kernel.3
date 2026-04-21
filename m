Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9C3F8FA7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 13:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGLMQ9vsDXriWXi/hkSvoa4g5VUn5tALFvB2fJyky3U=; b=AFZxGtSSLFZWAAQSaGsEh9cpw0
	e9ycGN9Wyj0h1F08zFw/QNXFpAtpujQNHslzHmdbLmyDcUqnM1BvcucgthzVDBE5y9vKgW1v1wyRP
	uFw2dMLsuCmgx2sRdaGzgKPfZ2/fQFXxt3X50H9vSYb+uMC7x/lcR6xzM8tobVkeyaOX+mv8ai63v
	CZoya9dCp3dnukK2hJ6jptDK0Uzmd2ZDT2+11n7iKFo66dmkHDO6Hx15ywSAO9F8SDFBCpvcLnuK8
	pD3AyvYcDwbUHjH8uyKApp7UlvwWbJRethOt3Rx85iS3oHUXdDrigwacMJO1rzFYcB/0orjPQEGB/
	ABk0QRxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBWZ-00000008hHU-0im1;
	Tue, 21 Apr 2026 13:52:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBWX-00000008hHC-3NEw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 13:52:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CF493600AE;
	Tue, 21 Apr 2026 13:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41CAEC2BCB7;
	Tue, 21 Apr 2026 13:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776779540;
	bh=hZjlH3OcxSPjJyeaxOnBm2U2CEPno6/ZUqa7aN4sdkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tchhhpypLwxx64yAc3c+6hHvZEVcgsmzsJg+E6+THJj/kIcoOIfRxkvFQzLydi0E2
	 7e5pEZT+DptSrd0qjtoQcSckh5Ni2XlW7iAryKABFO7UyOvEpaOaya43h57N1rQgfY
	 XKRF3qOMtb/MB5lpboiyZABTGUe46E0GWhuTrnZijfC8ZLl5fRBgIgKURMjCcXDLYp
	 2An750bSm899RzCr/udBqs+0GCk5BYtdnE2gobri6zR4zPqxlXENx7n+yJLI/i8yh6
	 /zolYZUrPrYJdtB59gYH+Xd6hF6WNLQCfL+Gl/vboAeNdwGp+zzHBoqU3sJfMRjfQE
	 8RtDUTwXduw4Q==
Date: Tue, 21 Apr 2026 08:52:18 -0500
From: Rob Herring <robh@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-kernel@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: gpio: zynq: Sort compatible strings
 alphabetically
Message-ID: <20260421135218.GA1048828-robh@kernel.org>
References: <20260421104358.2496125-1-shubhrajyoti.datta@amd.com>
 <20260421104358.2496125-2-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421104358.2496125-2-shubhrajyoti.datta@amd.com>
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

On Tue, Apr 21, 2026 at 04:13:56PM +0530, Shubhrajyoti Datta wrote:
> Sort the compatible string alphabetically.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

Missing Conor's ack.

