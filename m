Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10853D62077
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 17:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g17CqHngaEKH5JyYjlv/LieT6pqgO27q2weLbDPNWs4=; b=seswYuFY5mrvkKoEJ1oatqGjos
	zVKNCvn3t8rhzJ/JBpm/zjgAD9IpjXoHkwecdwstr3ArYk9sOlr9RYG0eA1BWXwrjv/nyurDd4KLC
	F4Ygy0CZCCmxespv5j23+ot8OAPc40Oj6toFd7KeZ7K9kZ3RfmSFpdoY6QTAKhPMjz33H5+b8KPq+
	mSfER9bDIfDH9H0brvw3/6pT1BZ6qDSei3WqWxhvKAG19dSyYpxRNoLjcGCpvidunCLxr7mEErJD/
	NN1wuX9uHz5DN9nF3iln5R1eZYSOdxGrIogXXtVSMlO9qHjKXc+HOU2fI4hmrWdTHN4sSHH+UvQ5m
	6ntzi7tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDS9w-0000000DExw-0OxA;
	Tue, 19 Nov 2024 17:37:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDS8z-0000000DEo3-3ueL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 17:36:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2D8B65C578A;
	Tue, 19 Nov 2024 17:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC175C4CECF;
	Tue, 19 Nov 2024 17:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732037764;
	bh=7mXFIY79P4EkftJLNh7R7PZZz180CKrz8oYCEBN+4Sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jzblwibh7/loTymKSNrM580HiO4f0h65wyajtEwaA5O/jrGPwZJkNNg6kcsKoXLPk
	 MinF7cIuJXhcXH3h2UwAhF+esWmMnzVtdo2z+0AJxfbbLF5pyUsyovwMzau3DOX+IC
	 VExWbxHGkiWNkR8QSan/MP29iGqy+CTnIUzjKmZRr+GcuRwKM/LNB7q77CkGzzShMG
	 2C2FZk0++z6ERLxvO/dwckVELX9mpxsICE0DAnfckbW/+rFkCU4mz2C04Od13mQ6tl
	 kvnSQ//VJslGZVU+9QBHKB5KuBj0h9N+m6dtEH/rm7PfkTPSRTR6byFi0RQ+mag61F
	 J1KgyBhFLDklA==
Date: Tue, 19 Nov 2024 11:36:02 -0600
From: Rob Herring <robh@kernel.org>
To: Bryan Brattlof <bb@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am62l: add initial infrastructure
Message-ID: <20241119173602.GA1858974-robh@kernel.org>
References: <20241117-am62lx-v1-0-4e71e42d781d@ti.com>
 <20241117-am62lx-v1-1-4e71e42d781d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241117-am62lx-v1-1-4e71e42d781d@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_093606_009392_9EDF77DA 
X-CRM114-Status: GOOD (  11.20  )
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

On Sun, Nov 17, 2024 at 11:34:07PM -0600, Bryan Brattlof wrote:
> From: Vignesh Raghavendra <vigneshr@ti.com>
> 
> Add the initial infrastructure needed for the AM62L. All of which can be
> found in the Technical Reference Manual (TRM) located here:
> 
>     https://www.ti.com/lit/ug/sprujb4/sprujb4.pdf
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
>  Documentation/devicetree/bindings/arm/ti/k3.yaml |  6 ++

Bindings are supposed to be a separate patch.

>  arch/arm64/boot/dts/ti/Makefile                  |  3 +
>  arch/arm64/boot/dts/ti/k3-am62l-main.dtsi        | 52 ++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi      | 33 +++++++++
>  arch/arm64/boot/dts/ti/k3-am62l.dtsi             | 89 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62l3.dtsi            | 67 ++++++++++++++++++
>  arch/arm64/boot/dts/ti/k3-pinctrl.h              |  2 +
>  7 files changed, 252 insertions(+)

