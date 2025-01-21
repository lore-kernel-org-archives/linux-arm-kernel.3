Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD8FC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 16:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbTK+rVKLBnsmGuJaURQlyb5gRmUsxHhi46+45ugDMA=; b=CZ9iIYnT8fgUCNIfl7flhKpzSt
	65vkAZ3JZQS9AE5O6rwnaNC89hjRivnZUF4Ty2jv3CSJ/zwvsLuihiFkqmPdzJxZ1ZJ7CXRp8qyJ0
	sxQPSErjRwlIcqRWt6JM1/RF9rcOISzIYjyu6awLAbnHrhCGWhSjEuwDkZs1Q6+EmM67TN5FKL4eg
	vOIPQuKnnZuXRzTh9PrsVwPMlfbMkeAL16XxZwTXhTuaFN2/p7JDD4QEC0GIYFpOd/QQ3yZrlkip/
	8g7fqugo9llovYL5Qm6byrH6/gsSeqlIzOHO8ptiP0ca9EU/UieFLetEnI7CbigEaaeJhlx0PhkBv
	aF8EPZFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taGh6-00000008IWX-1BkU;
	Tue, 21 Jan 2025 16:01:36 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taGfN-00000008HzF-10GX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 15:59:50 +0000
Message-ID: <38892dea-f850-47d8-81df-ae8efd535272@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737475182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jbTK+rVKLBnsmGuJaURQlyb5gRmUsxHhi46+45ugDMA=;
	b=NDBH42QXWTr2fIIUP1hriAEj/wyiiihuoSRQwSkjBkv7fbmOLY/gVFuOXuM6HroK6Jx1j9
	NqzYwmuIvQgI5Xm1UGvAoG/JcR/w7un5ig5b5NKJX6LNrRxkTchZHHeILl7ZOMJEf2dg5M
	VsK5ESvGooxYfyKuEZ/UjBAgqFKNEO0=
Date: Tue, 21 Jan 2025 10:59:38 -0500
MIME-Version: 1.0
Subject: Re: [PATCH net-next v4 0/6] net: xilinx: axienet: Enable adaptive IRQ
 coalescing with DIM
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, netdev@vger.kernel.org,
 Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
 Shannon Nelson <shannon.nelson@amd.com>,
 linux-arm-kernel@lists.infradead.org, Heng Qi <hengqi@linux.alibaba.com>
References: <20250116232954.2696930-1-sean.anderson@linux.dev>
 <20250118171936.703c0a27@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250118171936.703c0a27@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_075949_444702_0872AAC9 
X-CRM114-Status: UNSURE (   5.59  )
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

On 1/18/25 20:19, Jakub Kicinski wrote:
> On Thu, 16 Jan 2025 18:29:48 -0500 Sean Anderson wrote:
>> - Fix incorrect function name in doc comment for axienet_coalesce_params
> 
> Huh, I wonder if you sent the wrong version..

I think I applied the hunk to the wrong patch.

--Sean

