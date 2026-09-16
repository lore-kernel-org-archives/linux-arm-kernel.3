Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A20C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 13:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKavffle4neT9GMaTZ2rSYi6SqO6U6tssCdaO32SjGg=; b=lt1iaaGbAO3UGR6h/kGcmoYr3y
	5aqGvs58Q1TyI6G5HrpvBfz207+uNyf/p7dgpoOeuRzWOwGUnpvcXn+uWbyHsQxIBd81NMAW+LewW
	NCSeqGTczf3xEllcIaGDj74uejE2Jv2IYmPu90l5NHWa7YUbi57L32jonZ+f3sLFgP/2FTDQV0Lgw
	1AIjIk9d7Mw4+vJ+7S4YYKTBFv4V+l5T/7n90kgGl0TuxyPPqecwOOyN8iH/5CJUlIl/IlMXQJ4uJ
	PN5B75w9Sdg101rCLJHQ1dP8RO1XK4TjFBiNfgQaWXL8uXxu+bBGve1hhKM7e3ciiwmOYcFqS9t0R
	Qql4eMVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pVS-00000009FRe-30Gx;
	Wed, 16 Sep 2026 13:16:58 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pVO-00000009FRB-3KoO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 13:16:57 +0000
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6A1867A0100;
	Wed, 16 Sep 2026 09:16:48 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-01.internal (MEProxy); Wed, 16 Sep 2026 09:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789564607;
	 x=1789651007; bh=jKavffle4neT9GMaTZ2rSYi6SqO6U6tssCdaO32SjGg=; b=
	Ap2Qh3lsL4M3EfUXfTW7gVuBEpKnY3dKxMp9Z+iqyQvb4pOksZY6Z58FU6gqKOCJ
	QWBVy2OkVnPeYuQ6V3xOe2qyL7YbAiIE9rmUMP98oQ2O79qBKDmfru8MbT4RPqLr
	LyrzLEUUVIWfIY167OqwFgKjiCmpCBBYLvbjfUR8KJJXSW7mCgY9YnQj+cH7Wp3C
	QkdkZiw0fwch2mBMIYSmWNX2v/ZJ/04OvS582CUIa4JNpje7DoZnQFkxsvFsFWXt
	t1dVHoHkesB2+v+HfUtw7LiBFyhds3jBlJ2l7hXAn++Qij8jXaPAhEM/CBHKSdTW
	w/47aBOnx0CmHMdfkwhc6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789564607; x=
	1789651007; bh=jKavffle4neT9GMaTZ2rSYi6SqO6U6tssCdaO32SjGg=; b=l
	EjeA3IhxJxD4GtJ78eF/7QPZTqfE89I0Ik7Up/wEXFwjD7Evb6a1G0CXJbX2/hd0
	pJPu1JqCjsZO9S3hfux7iJ/dUak3WjYV5z2IVU2dPrtk14UXaFyvxH/FiaDKjdQv
	aPa5L+T6yQdXMabLfX9t3en+BnnuaDl7Tx0FEnAQWGxuHMFDAai0kB90PRg5mkp2
	d67UVdhgcZxb7HmjrGIrlUFjJ66bMZxrQ+aKkcTE4QxuboK00cY1O2wErtd1uSD6
	sWLmynMWKzbRiZVjpX86SJ3sKL+iDAqXdJQmo9m5TfzrFxtWF6vlaR/oPCnpGIRl
	l1C5ZaBms3TIyPTAvkpAw==
X-ME-Sender: <xms:uZaqakJGpMtxTFmsF-xLuuL556T16Vyl050-Z0sg_G9xgl7--AklcQ>
    <xme:uZaqautD07o2FuDoi-W218MTavysMbqcSxLuya3QR2FHZS7yrKnM8cPcTquuqaYG6
    SDW_oIYKN3bAPm3dsE-nXYRvUb_UHOWsMU0whQWpWei_YTaPkRMwRAv>
X-ME-Proxy-Cause: dmFkZTFnplgyCo8M36BD8SpLaZmp7STqRcXPok5KtM5tUgC1ZV7i/mvJqoZoGQWaQj7pMw
    0nWk/oGrv9BgYuiSHl1wpjttdvYQ/Emrd3tM8Q/TAa4EECiIC+uIQb6kmQUm3849C0kuBn
    o8h981T+Al4QsogzbVxkXZxhOtfKS8sC8+DxyEdhnEQ8RmknuGVsYuIz9DkMGD2N4T7zxS
    c09z2RVKAeD+VuXdhAJObk+oAxJBBp1o5bXRH23PPvWlLQw176ixJEiA5O838te8cIiRjB
    OQa+0bLw/hqvqkB5RZsa5cHTrDUpjkgRPQCGH29/Re0FaZgGDkXClrr64kLzWTuVHtzxJ9
    gd7Qdja1y8K25wWnQQK6ErNwxrFwNmCvvRSlIHTrPN+XHGUOp2nQwOz+5WK6l0Ye2+tXby
    Ll2U9gqjjb/yn/Jo1ZUpz62Nc+5FXiXb+9GByAeRmxrZowwsLJ2AsTATTJPiqvLoHj5KWF
    SvH+BRdTbkRPz+pkHDfIpSZvYFqHhqhnD5acBq0cq7cuJzKY5tU5ZwxF2BXfssS0yEaA27
    DtEra7+7UaGjyabi/du39U+Brvp1woct6HCRh17BHE9NBuEqg9Wy0TGiYU3PIsbq88Y9/n
    X0y5qNnIsDd8W0xwF4DHegggig6nRRJ1+5EMXvr6h9EWgcnrFNizH6HXuBSQ
X-ME-Proxy: <xmx:vJaqat7Auk0s5H0fK7GO-3VmhZWjLEW04eSQ_S7LhXnD7H9sSjLlyQ>
    <xmx:vJaqasiZPEgXcpVlil7GgGazN3xDpPK3DwuWqTB2sFVGI9rTf0wJfw>
    <xmx:vJaqaogPGc-H5IOzGwSymZ2Hidd3khEc4i1RIbAvb2N4Isgdis7q-w>
    <xmx:vJaqaslzEbmD73QVkMSNYndfj9ffJAoN5Ib4u2dDgDHIm8OpycAHlQ>
    <xmx:v5aqamWzwoSqWPMMiWbqSdOCGAl71oBqQ3irNw_rAHx0rWjxgjIWISoM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id BBF9D32A0084; Wed, 16 Sep 2026 09:16:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AcI4sQW32jCJ
Date: Wed, 16 Sep 2026 15:16:13 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: pankaj.gupta@oss.nxp.com, "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Frank Li" <Frank.Li@nxp.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>, "Pankaj Gupta" <pankaj.gupta@nxp.com>,
 "Randy Dunlap" <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Message-Id: <2034fb2f-f169-46a5-85e8-fa723ddb0360@app.fastmail.com>
In-Reply-To: <20260915-imx-se-if-v51-5-4a7dac612cb5@nxp.com>
References: <20260915-imx-se-if-v51-0-4a7dac612cb5@nxp.com>
 <20260915-imx-se-if-v51-5-4a7dac612cb5@nxp.com>
Subject: Re: [PATCH v51 5/7] firmware: imx: adds miscdev
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_061654_922173_D657E033 
X-CRM114-Status: GOOD (  16.73  )
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

On Mon, Sep 14, 2026, at 21:40, pankaj.gupta@oss.nxp.com wrote:
> From: Pankaj Gupta <pankaj.gupta@nxp.com>
>
> Adds the driver for communication interface to secure-enclave, that
> enables exchanging messages with NXP secure enclave HW IP(s)
> like EdgeLock Enclave, from:
> - User-Space Applications via character driver.
>
> ABI documentation for the NXP secure-enclave driver.

I just saw this in linux-next, where it has caused a build failure
for a missing include of linux/slab.h. I hadn't see the series
before (even though it is a v51, which seems crazy), but I am
curious about it now.

> User-space library using this driver:
> - i.MX Secure Enclave library:
>   -- URL: https://github.com/nxp-imx/imx-secure-enclave.git,
> - i.MX Secure Middle-Ware:
>   -- URL: https://github.com/nxp-imx/imx-smw.git

I assume this will hit the soc tree eventually, so I want to
make sure the reviews have covered all the important aspects here,
and I don't see the answers in the cover letter:

- Who has reviewed the user interface from outside of NXP?
  Since this is not a vendor-independent API, I think we have
  to be extra careful and make sure this does not duplicate
  anything that is already in the standard firmware interfaces.

- Why is there a low-level passthrough to the firmware from
  userspace? This looks rather irregular, since it is the kernel's
  job to abstract the platform and provide vendor-independent
  interfaces. In particular the bit about shared memory and
  the generic send/receiv ioctl look like they should not
  be there, as those would allow side-channels from userspace.

      Arnd

