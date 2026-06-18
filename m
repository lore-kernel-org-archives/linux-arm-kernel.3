Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983E6CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 15:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjKrG/uiflqwml1P+h9rk0GcO8cqFprpJHc+2Ca1Xq0=; b=omXVI9No5JNp/Yx1zrHr9CCzLQ
	IRloV4gOCMc28o8Kk5R09uDUfbmAwtYA7+YnPt/nFG+z2p/P81p4BWW3MoNZ1lJ0TB6zKkSz9Jvy3
	Ejss1YFKPmYx0i55Mh8cdy6Bq838apRY0nvVniAIKAEac3vgB5FMQFZLiL1Qqbe17Dm7Br4rWpay3
	r31us4MUDEXTieWTnaWVmM7bf5N2aQAnsolVApZS8ohMFzsls6PRtJZWpDmWRXcWep/rG81uPM46j
	AetDytzDn1ejP2Gng1MzDaHq6xGPOiSdCf6pPkDYBisRhGbK4Uw2OqhEc9KYiVTF0NWsWAMkUp7av
	tysynC3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waEyi-00000001VjK-46cA;
	Thu, 18 Jun 2026 15:48:28 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waEyg-00000001Vii-0tzN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 15:48:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1781797703; bh=uCXl/Add3HoeRazrrsXKsLsrykUvT+dNm/0BV4NN7J8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LeIOAAQZ2RTPfJfCi0KozwbvUtwUseqO/tHTGc77J6MXxbSpfXfmGl5VlHSWuXtFs
	 ofxoC3SL2lvma2+j7TkAfVXMq0Mwc5rCQEqkVNCPHewvR//G3BXbfYuHHeYgBEL4Iy
	 HJ74opzvLwCqGaRL4grddWfe6baPIdPBnZZtFu9mmOgKP6UWsyNkvtA4ITUCxS5l5s
	 Rw1EEah5jV7aEcuZ2PALqcw4TddgdY+VB91BWE/Meyy/A8eC0qyW9gC/YbU013ORoM
	 0IiCGWZJ96/D15Wdjq6v0xVzGiW9ifs4KH+4WJaey+QwtGRyIqPWS1Fc/x3Tc2k4zV
	 yQM4EnUzSYmXg==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 111D13911ED;
	Thu, 18 Jun 2026 15:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1781797702; bh=uCXl/Add3HoeRazrrsXKsLsrykUvT+dNm/0BV4NN7J8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e4d54Xda3CMi8yGO935DopAK67wBsPfS6ltay/OPeAUjV1QpAl5Rp1l0uFxvx0tPY
	 ZnsSKHRTiJwdFcWC8kTKpNp5+1l6eRD1XyNGPk++R8YvdTjs+PP5qdBsC2tpM5eo5W
	 9ZF+p+PdwoDLihKyossohSx84kQbHOMIVm2G80Qz511hqmJfSbkUMkHx8jIYVvEaXz
	 5vqNBOjkAdB4ip7mJlVhQMy42Gi3dUzX+1zm0hEesRcLArbxZgMyXNPIhXxzi0sls+
	 95jetLPKEoOquev/FTIcxW3ZaS+KDKvjm5jy2mxeixkPnjtvGti3qMqXo1It66Q76E
	 8wzg8a9uXKnjQ==
Message-ID: <5a84caeb-59fb-42bb-b717-578fcfaf8a8f@mleia.com>
Date: Thu, 18 Jun 2026 18:48:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] i2c: pnx: Use generic definitions for bus
 frequencies
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Andi Shyti <andi.shyti@kernel.org>
References: <20260618130948.3199768-1-andriy.shevchenko@linux.intel.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20260618130948.3199768-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260618_154823_094444_D6336B07 
X-CRM114-Status: UNSURE (   3.47  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_154823_094444_D6336B07 
X-CRM114-Status: UNSURE (   4.85  )
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

On 6/18/26 16:09, Andy Shevchenko wrote:
> Since we have generic definitions for bus frequencies, let's use them.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir

