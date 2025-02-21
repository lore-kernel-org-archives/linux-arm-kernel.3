Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5A5C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 21:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Sv95soUBk9f1iq3csiKP86fpBD4wT9Wf9FIWGLF+BA=; b=WZFw8KoM4cYbLsW+gPWxa+87es
	v3RwEARRlY/zh0NZ9pKfRltA50dxhphqONwzaY32c55h5UknpnD4pzjFlRD5NtRbqanSFgytzO4u/
	WxwylwuyX4VB4qgpS+RAwcONVbi/nO7ErDjd6JSYMKHSVR+J+1BSGHywkKzqu3AGbFflvIJZDFdVI
	L2IyLFcU+EW0OWQZqmrBuo20EOhM2svILuGDKn9aBA3/0MrPfDtsvTaVeGeTIibq1I/LpTeesbMZt
	sNyLoBDB6PRL4t4zQ82kjD5iycoz0VM/m7EC/fTpxBKwjtB4Ap88iFpbq/9lp9lPvjK1zshfzXYQF
	sDvYECNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlaIw-00000006t5Z-2i4v;
	Fri, 21 Feb 2025 21:11:26 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlaHT-00000006ssy-1IcR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 21:09:56 +0000
Received: from [100.65.233.50] (unknown [20.236.10.206])
	by linux.microsoft.com (Postfix) with ESMTPSA id 45654205367B;
	Fri, 21 Feb 2025 13:09:53 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 45654205367B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740172194;
	bh=1Sv95soUBk9f1iq3csiKP86fpBD4wT9Wf9FIWGLF+BA=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=Bba0KgUcYGfQfDwvZ62M2/uTWl0oR1665JK7ognoirmrcpNPC0S9yj19kQxmMgamv
	 YOqV7hX7lQvmmvM70CPnek6ETCXuZ7rU7eeL9rwz6gGxO1dTYX1/XOkdOIlDRvU1DC
	 FbBE5mxascNAW6umvXY7gcKvR3p2ZWvm21bNUrjg=
Message-ID: <0e010ef1-c29e-4d33-9bec-61679e1d7a3c@linux.microsoft.com>
Date: Fri, 21 Feb 2025 13:09:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 iommu@lists.linux.dev, mhklinux@outlook.com, mukeshrathor@microsoft.com,
 eahariha@linux.microsoft.com, kys@microsoft.com, haiyangz@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, catalin.marinas@arm.com,
 will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
 arnd@arndb.de, jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com
Subject: Re: [PATCH v2 0/3] Introduce CONFIG_MSHV_ROOT for root partition code
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
References: <1740167795-13296-1-git-send-email-nunodasneves@linux.microsoft.com>
 <991e7df9-d814-48a9-9469-a0b2f72acabb@linux.microsoft.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <991e7df9-d814-48a9-9469-a0b2f72acabb@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_130955_379514_46134CCE 
X-CRM114-Status: UNSURE (   5.37  )
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

On 2/21/2025 12:01 PM, Nuno Das Neves wrote:
> The subject line says v2 but this is actually v3!
> 
> Nuno

For the series,

Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>

