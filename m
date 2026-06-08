Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8014ACD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 01:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KUxNK4roQZlfzNGNej2nyL3RkJMcfEGaNe2y2Xztxo=; b=YvHQHJOEV9125Um0URZra/puqr
	K0qzxL5xIkiL4NQRYo05k7AIw9WIO0pyJpF8RYv0Z/rOBQxrG24Qxm0oxCzgZVK0gWciM8/uhGVWz
	v7PQRf/2TOhlZFkhkYmqcYhCefOxe0OahpccS6hl6Hazx8oZpuBzf/9w2SvR4eUw/rYkNfdgQlqjP
	GXYlrThNMqwyRrrnfDxoNYMwAop43RugaNxTsaLGkHf8uF96q47MU2E2//N2mVzdxuY5qTHzQLToT
	kW+CUCu/MTeuhIVX2xcROJILHetJxq+ountgGbxqylwWYVHJrvfgLR+cRfS4r/5Xy6IQs9BmdhXK2
	t9ffPWAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWOPr-00000002fZ9-0rrd;
	Mon, 08 Jun 2026 01:04:35 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWOPp-00000002fYy-3ACl;
	Mon, 08 Jun 2026 01:04:33 +0000
Message-ID: <60949d0c-fe4d-4a26-80e4-224e6060d24e@infradead.org>
Date: Sun, 7 Jun 2026 18:04:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: ABI: sysfs-class-reboot-mode-reboot_modes:
 fix doc warnings
From: Randy Dunlap <rdunlap@infradead.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260426232705.422938-1-rdunlap@infradead.org>
 <CAMRc=McUr8Tuv9+LNQ0=ufj1z4Tstp_ujmL=r7bXrLaBXg4E5g@mail.gmail.com>
 <d7cd7bb3-520f-4e80-8242-583f689f60db@infradead.org>
Content-Language: en-US
In-Reply-To: <d7cd7bb3-520f-4e80-8242-583f689f60db@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 5/24/26 3:48 PM, Randy Dunlap wrote:
> Sebastian,
> 
> On 4/27/26 2:11 AM, Bartosz Golaszewski wrote:
>> On Mon, 27 Apr 2026 01:27:05 +0200, Randy Dunlap <rdunlap@infradead.org> said:
>>> Repair the docs build warnings in this file by unindenting the description,
>>> adding blank lines, and using `` to quote *arg.
>>>
>>> WARNING: Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:36: abi_sys_class_reboot_mode_driver_reboot_modes doesn't have a description
>>> Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:1: ERROR: Unexpected indentation. [docutils]
>>> Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:1: ERROR: Unexpected indentation. [docutils]
>>> Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:1: WARNING: Inline emphasis start-string without end-string. [docutils]
>>> Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:1: ERROR: Unexpected indentation. [docutils]
>>>
>>> Fixes: d3da03025e6d ("Documentation: ABI: Add sysfs-class-reboot-mode-reboot_modes")
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>> ---
>>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> This build warning is now in mainline.
> Will you be merging this patch soon?

ping.

> thanks.

-- 
~Randy


