Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13D8C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 23:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3slLP0iSb4Tcp7fTj90CAGmrlssnSCsSA47YOOOaJw=; b=b6RaMQqrSrvTkdkso9pbBLFC93
	SNkYIuJLwnXBI7dnLjt+eBKAe8N+d6X/NYqdNJDDHiLt4fPoXP0FLmIPQblF92TSMTWXCTQktyH0K
	v1WCzxlu+7zQuwXecX05bbtijblMmBL3XiBetGcbQtlWw5edDDtGknTAW9oyis0o8O+rwgZdj5FMR
	8HBK1LmuWoGQQS2Es5w/kvMewZpUgceGXkgAP7UIF98XFcnRiB8eZqG1nePsF5TuPahqLWwpPk7Xe
	aRPTapCD44qu58ZPmrbXJuuTZltKnh1COsrEbijkU1QiOa0CT64SLf93F7/Zk8rH/jPd2JBlXVXDp
	R1/MHHdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tktOy-0000000Fg4N-2oN3;
	Wed, 19 Feb 2025 23:22:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tktHf-0000000Fdmp-3E3i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 23:15:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F19215C5B45;
	Wed, 19 Feb 2025 23:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C2E4C4CED1;
	Wed, 19 Feb 2025 23:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740006914;
	bh=FvIWJPGMEfhh3+fEPRnaH4CeGSJ/t8a5mgLzeJj6/3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZWWeuj1zn2Iuq6sH59qroWodU/O9ONCrcpKKM33LnZ/JF42dEB+jeGO8zqmdWGVAa
	 ybCyL8OS2UzrtVynrlTvybGpkjCiBlDvLUh0k/AkSGHlTDk/A/FklHsZppbaXTZTfW
	 sA/LOIY/jCOvSUXxFg8dId0YBMsqnnB72lv32JY9tfYRkAOTa2zFsjsEupQWGnOENw
	 Fk4YI2gZFzGrE+K2gJXLyImQW7uI5Ycg1GpPlAm59kTWsEsq2bCIJWxjmug2Z6wC3o
	 Vz7sR9WEHaBADgbqU50+skob+Mg++lwUsqxNsK6nRHvf2NP1stLUb+ONyAJrFO0Jjv
	 dbpD4oj0HKH5Q==
Date: Wed, 19 Feb 2025 17:15:13 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
	git@amd.com, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH] dt-bindings: power: reset: xilinx: Make "interrupts"
 property optional
Message-ID: <174000691329.3154277.6728737996238490277.robh@kernel.org>
References: <20250217095226.12606-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217095226.12606-1-shubhrajyoti.datta@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_151515_860556_D856B184 
X-CRM114-Status: GOOD (  11.16  )
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


On Mon, 17 Feb 2025 15:22:26 +0530, Shubhrajyoti Datta wrote:
> The "interrupts" property in the ZynqMP power/reset binding was previously
> marked as required. However, there are multiple mechanisms for
> handling power/reset events, including:
> -Event management registration,
> -Mailbox (mboxes),
> -Interrupts (interrupts).
> 
> When event management support is available (default on Versal SoC), the
> "interrupts" property is not used hence not required.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
>  .../devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml       | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


