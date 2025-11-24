Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7731FCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 00:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tjng9tWNpJXzRw6RmT3s8rul1Av3/jTSsqhuCeS02g=; b=b0fhdpAuyhTb5Zew4HxIsLM3JE
	RLHuqkJpNLeQ9L8kutqE2u3vcLOOzR3Ra+EMziKlEeP7R0soLkzBT3kUey1Wchw1EocGuYp9QCDOv
	c3900zKyRGtp5kkRST9q3o6UCYEy7GuHllHNYFsEIyi1yFdwKoCkSp/xPbYX67KqzJpaz3bxIYmtz
	4fpTAl3DCFsCa0vV8qpA+V82boW2hGHv1rCfAVaEgX4d096HJvUM9xaf7MCWGz0k+NhYbPruA4t2l
	d3vYR4LfgEHbZxMc8bRDv6aSj0wxnxaXgrfpXbig7/1LIs/AMuXKJeWaO0AEvNdFsmrUB8Zs8FRiO
	zEp7ekIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNKq7-0000000At3P-2nJa;
	Mon, 24 Nov 2025 00:53:59 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNKq3-0000000At1v-1BST;
	Mon, 24 Nov 2025 00:53:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=1ojNoYcSRgOUItS36fhXAjSvyt7+UNGNmIcHggvRc3w=; b=c
	cQtoVBJuCsQ92yBqd5UX1B0lyf0g+pDfzW/dD/Yi8EJYfFOB2sa+bwy/hF/qTVrD
	2KjU10veZsWvO1H6xjD7U1n1yLoVTjK8aIPPp+LNcLYvAPU9Vv4DJGx/Vy7RmvYn
	wu0w+y6PxYjH2AfoV6eM5nmem3hCL627qDvjV4HTdY=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-144 (Coremail) ; Mon, 24 Nov 2025 08:52:47 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Mon, 24 Nov 2025 08:52:47 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Heiko Stuebner" <heiko@sntech.de>
Cc: dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org,
	andrzej.hajda@intel.com, mripard@kernel.org,
	jernej.skrabec@gmail.com, jonas@kwiboo.se,
	Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
	rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
	knaerzche@gmail.com, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	"Andy Yan" <andy.yan@rock-chips.com>, m.wilczynski@samsung.com
Subject: Re:Re: [PATCH v8 1/2] drm/rockchip: inno-hdmi: Convert to drm
 bridge
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <8913609.MhkbZ0Pkbq@phil>
References: <20251016083843.76675-1-andyshrk@163.com>
 <20251016083843.76675-2-andyshrk@163.com> <8913609.MhkbZ0Pkbq@phil>
X-CM-CTRLMSGS: ARNM03BsdXM9MTc2Mzk0NTU2Nzc2MF9mMWFkMThkZGU5MGVhNWVjOWMxY2Q4N
 TIyODc1ODVlYw==
X-NTES-SC: AL_Qu2dAfWfuk0t4SecYOkfmUgWjuw/WsG1v/Ul1YBSP556jC3r1gsLcEV5OV7n7/K1KhiBjx+mVR1uxOl/e7Rgbog6ztD4kGMVyG9OqD90thYGFw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7cc43fc7.843.19ab3595609.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: kCgvCgDnUTxfrCNpAWAoAA--.919W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxR9lw2kjrF+srwAA3G
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_165355_731543_DA0EAFBF 
X-CRM114-Status: UNSURE (   5.40  )
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

CgpwaW5nLi4uLgoKQXQgMjAyNS0xMC0yMCAyMDo0NTozNCwgIkhlaWtvIFN0dWVibmVyIiA8aGVp
a29Ac250ZWNoLmRlPiB3cm90ZToKPkFtIERvbm5lcnN0YWcsIDE2LiBPa3RvYmVyIDIwMjUsIDEw
OjM4OjMxIE1pdHRlbGV1cm9ww6Rpc2NoZSBTb21tZXJ6ZWl0IHNjaHJpZWIgQW5keSBZYW46Cj4+
IEZyb206IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPj4gCj4+IENvbnZlcnQg
aXQgdG8gZHJtIGJyaWRnZSBkcml2ZXIsIGl0IHdpbGwgYmUgY29udmVuaWVudCBmb3IgdXMgdG8K
Pj4gbWlncmF0ZSB0aGUgY29ubmVjdG9yIHBhcnQgdG8gdGhlIGRpc3BsYXkgZHJpdmVyIGxhdGVy
Lgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29t
Pgo+Cj5SZXZpZXdlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPgo+QnV0
IG9mIGNvdXJzZSBJIHdvdWxkIGJlIHJlYWxseSBoYXBweSBpZiBzb21lb25lIHdpdGggbW9yZSBl
eHBlcmllbmNlCj5vbiBnZW5lcmFsIGJyaWRnZXMgY291bGQgYWxzbyB0YWtlIGEgbG9vay4KPgo+
Cj5IZWlrbwo+Cj4KPgo+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPkxpbnV4LXJvY2tjaGlwIG1haWxpbmcgbGlzdAo+TGludXgtcm9ja2NoaXBAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yb2NrY2hpcAo=

