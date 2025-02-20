Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE39C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 15:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S4iuN5lHb8XVOzc4P+LxDEoRd+/KN6WlmLqB7+yprGE=; b=j3TvMBbjhGbhJM7kneLC+q/aE7
	te+2ABvkf1HEAn9VfZ/QVEstoFn1hiQDL/TT3TKr2uTzAfeUcp7OozWU3v01Sz45GW5zMOdJqVB8b
	1k89HEYY9W7+NpdhfYWeKFrI8nCBGAPsNz4Y6vkLkJ9jbvty6MOaFoo4H8NXnmRbG5PMRab5e6xq+
	sSJrzLPG9FLbDWt1ZHWDF3yBc07EyzvrdNFa+/+oKM0Kq8l09veOmDvqW3Ov8z/q6RZxolOxsZW0d
	8UOwMxOSfSBFZqsqeZvTvc99ocmNlGW7x0VuJwaQrfH9TIhM1sxatI0HVtYPn6Mz9WtJobjUxZWVd
	eOya16cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8Fm-00000001Vaw-1amE;
	Thu, 20 Feb 2025 15:14:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8EH-00000001VDJ-0kwo;
	Thu, 20 Feb 2025 15:12:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 83BEF5C02AB;
	Thu, 20 Feb 2025 15:12:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D2AAC4CED1;
	Thu, 20 Feb 2025 15:12:39 +0000 (UTC)
Message-ID: <55389b80-9f0e-4423-8e92-c486de058720@xs4all.nl>
Date: Thu, 20 Feb 2025 16:12:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: cx231xx: Convert enum into a define
Content-Language: en-US
To: Andy Shevchenko <andy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
 <20241202-fix-llvm9-v1-1-2a50f5acfd0b@chromium.org>
 <20241203093114.0ca49c01@foz.lan>
 <c896221c-5ff2-4a2b-b431-7c7f805b4f68@xs4all.nl>
 <Z7c252IKhXdysjAi@smile.fi.intel.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <Z7c252IKhXdysjAi@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_071245_267599_7BDB89EB 
X-CRM114-Status: GOOD (  12.29  )
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

On 2/20/25 15:06, Andy Shevchenko wrote:
> On Thu, Feb 20, 2025 at 02:55:42PM +0100, Hans Verkuil wrote:
>> On 12/3/24 09:31, Mauro Carvalho Chehab wrote:
> 
> ...
> 
>> ORing enums is really not a good idea: you would normally never do that, and
> 
> I think you missed a keyword "different", so "ORing different enums ..."
> which I totally agree on, but the same enum values are fine.

While the compiler might be happy with that, I think ORing enums regardless
is weird. It's not what enums are for.

Regards,

	Hans

> 
>> the compiler warning is IMHO appropriate.
> 


