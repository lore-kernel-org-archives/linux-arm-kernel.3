Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5ECCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 12:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQJm+nh1dSIeyxxVeRhCYQmt/xUGFsx9urnYb5ZA2w4=; b=wfavz9sF3JDCWIJFpa1xmZP6fU
	bRUhYiUC3x9GvlaJeUpaHMjyr5twl8+0XTRDi9704OQ/1TsJjw7Il8h6NCYo3aCzJH8VKk5zuhJAV
	Ako35ax3CBcQdOF9oTmVkuNwK5l/IhQfYEk6+0nLUfWZfL8635QyfBPQ+zxGTdkBSeC1xzjL0tRVu
	8ggbeYfD8MSoPujxQocNakSa+GZQXuga+jR0mWqng5GkBWE2SX/Pa5nXztsSSvnf6i4o5k1cOGAP0
	DOWMW6blkr0iYCEXybNRemSLfRA/2dBLiXi0DOLBNPwX9ei3xj139+trjDMkVwFbSe73bCldiDbh8
	lc92SyFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3wKZ-00000007wkx-1ukB;
	Wed, 01 Oct 2025 12:53:15 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3wKW-00000007wii-0JnF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 12:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1759323157; x=1759927957; i=markus.elfring@web.de;
	bh=EQJm+nh1dSIeyxxVeRhCYQmt/xUGFsx9urnYb5ZA2w4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=EG8DJmVSfZBa1kdt1vOvdKxj0DpOyANed8FoKyfOXwsdJpBVr/bFFRawwWoxYN7K
	 8CbacH7n8IbxVOv/qzFpilnhjwbgmlO+ioPhCFe6EiP6BU+9HwhIIUD36GtTQYc4R
	 6EIIEvizR392upiOYYlvxqAPmQI5SFFVkodrH7ZBTRKJcKIt+m8IEyO1q/4y9tWSq
	 9WF5HqUZEriQqsR63ZqN4aDfqOpbGO9VNrkVvfzZwgGA8VmE/pwPPq3DwmUPb2+vn
	 BjsHQRXiwj+9K+EY1R72iYNfliBzhxf8Lb4WHu482oZ6HU8DmZljm5u2Z4EoH4HiC
	 /kO23+hxBmh1GImzyw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.174]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MJWsc-1ukDc51gAy-00Yx66; Wed, 01
 Oct 2025 14:52:37 +0200
Message-ID: <a3b93cc1-0c0f-4aa7-9b08-b3821ce8e70e@web.de>
Date: Wed, 1 Oct 2025 14:52:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mfd: macsmc: Initialize mutex
To: Lee Jones <lee@kernel.org>, Janne Grunau <j@jannau.net>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Neal Gompa <neal@gompa.dev>,
 Sven Peter <sven@kernel.org>
References: <20250925-macsmc-mutex_init-v1-1-416e9e644735@jannau.net>
 <1bc9a4b3-7a8d-4bcf-9481-36fdc76e066c@web.de>
 <20251001095505.GP8757@google.com>
 <0acf13d6-d63b-4079-93ba-d53910e624d7@web.de>
 <20251001124825.GR8757@google.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251001124825.GR8757@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nIlg7r1TlwM8dgTZVwT5C9K0hIr8YKLDtBzoTr+qXcyL1N5q9HG
 o7giU8FzZ1Ouvt3qmbrdpUSIFYlpJ16xudJiYXRiP3+1ITqaVT0RIBZDyLwN53AFbAlrlcq
 FzNoAVUoupvPYbnkJVsNDEo6qgI3H+JjFw3muEVhWFU8d8GfAXhhgOsdTGpttNmXkh6T9+p
 3Ikq0nL6BDDjaDtX35WuQ==
UI-OutboundReport: notjunk:1;M01:P0:sj/TfKZW7vA=;K6f1njouEq6XGoVGCyR3Shd/oJo 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 2TFD7b3FUdiKhQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_055312_412748_57D0EC32 
X-CRM114-Status: UNSURE (   4.38  )
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

>>>>> Struct apple_smc's mutex was not initialized before use. Surprisingl=
y
>>>>> this only resulted in occasional NULL pointer dereferences in
>>>>> apple_smc_read() calls from the probe() functions of sub devices.
=E2=80=A6> However, you must also provide your own context.

Do you try to support the creation of improved change descriptions?

Regards,
Markus

