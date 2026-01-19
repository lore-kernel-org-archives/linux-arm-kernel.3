Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C368D29C4F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 17:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyt7EEhoh5NwywEG1rYGsyZMG2+eh5CF/4sT3e6waB8=; b=euUIGQjMdeJAZreGvms5Ot6/eQ
	LOsVuXdvjSbZfiKDhUF8yUs3P2GKTTgZ1W93Qgt+hi8dikM0ujJ9+92AneYQVp/3Ft+xdHm5K4i/V
	iB4DEXZZ6p8zoUI1DSSFI49PeZFVd2AtrgXaZg3W1j8Op7eeK6nS41BYdHaYCnx/ggSu6Vzo4y4GD
	f6nYoSPjZp9+llwDPdhONivzt0QfR0bY6zGaLG7hqcY7CwJkwbmvp6Sp+SryWIKzPutL7wcG3hWyo
	921/Io/tVycB+DbQy/0gKWqPmF20onj+JZPeDjnr5GFFDEjAGYU+hJKcWgscfwQwDBlYf1n1HUwcC
	ZGMrBg3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtUc-00000002fk2-17As;
	Mon, 19 Jan 2026 17:56:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtUa-00000002fjs-2xua
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 17:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=gyt7EEhoh5NwywEG1rYGsyZMG2+eh5CF/4sT3e6waB8=; b=DZs2y7HiHBgSOF565KSUtsyxuk
	8YZ+RhoDa7uSeBwS4X3cAz2kUkmow3xTug62/sX/SP4OBdXulbMldZWpomptT+qvXejHvxTL3Ejzm
	fy98JRTVnX2Ne2pIsdUrxeN43r10OTtTOXAia2i5eouk+KW4vSSFz+LktX9TZdQOlHBCL5KpDZxuz
	9wVjTLfzTLAppr1SPg5OTy3+pIM/YxJI5WV5o1cx9pFv6U1siEQygEQ77jNzOUSch88QgR5QCt984
	vpXGM/S9p99s1QUReAs05rgIODzQmtc0jAhhc6d7G7ujqDYahkth6mzRFz7D8mtTxISkDH9MaOwHz
	5E1W9hXg==;
Received: from xmbghk7.mail.qq.com ([43.163.128.48])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtUW-0000000DeHV-1BJu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 17:56:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1768845392; bh=gyt7EEhoh5NwywEG1rYGsyZMG2+eh5CF/4sT3e6waB8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Zc9Jr3QSFlMGFY9FJ9Ks7n8LskUc7uT5f5XMrApX36B7Sp2XQ5VizBxB/qhNKpS90
	 Ju6n3zJC1QmGPu9F/wks30Cx2pGa/KjI9cdDK9HerSAyBEH2be3nKkFhH3FVNvncup
	 QuPkK66zWTPYNgPt4UsrK43u6onVNRbGdElOM1PE=
Received: from [198.18.0.1] ([2408:820c:9008:ba52:1551:afdc:1b7d:4912])
	by newxmesmtplogicsvrszc41-0.qq.com (NewEsmtp) with SMTP
	id DD43F682; Tue, 20 Jan 2026 01:55:20 +0800
X-QQ-mid: xmsmtpt1768845320teerxm2ak
Message-ID: <tencent_C06105A21611283E4866B846091CE7B3CF06@qq.com>
X-QQ-XMAILINFO: MFA3rFz8fXqr/mX5GUxKxvLf+e1/bhLKl7TDMrAZaAVlbNzk6Fr12ePNH3N6I5
	 wTHlHYFAoiCkBjOt/FVboZGsnUblYZM1EALPwQKlnlITHynGPfuxPV92AqKWs94/r4fUiZ4fX2M7
	 OReeKjkkU+aBkocSzJJcyEzVR/bfhDMSr/Y0If2+kH7+IyZpjzbUWgnj5ouuAPdWIlIr/hjviXIb
	 bDUmrIEkgvaWKUJeguZAhT+/3LG/WEfdIJ0xhviKTTJRHBGvaWXoMElHlj53CwCAefYQZfog+iNJ
	 UExe7kGCh0wERvt/EcVif3fxM7fBc+3NQoSgu8uG/jxsJeYk1r2x/sifw9LEMiRJo+FjR5H9BoSK
	 g9WEYxLv5vZmdZZ2Oy1m+bIavE4gF/iKXT+oIvNtTNBXQeJ9wPQdmvKtWogTozpkNoIlbVp8ENYq
	 dFkMDJwMsVYjnOXjCW7OCmJnSRF/EijUEPpvOErK0NJ5Cz0om/GGsRy6OkICEInX4N+t42Xe49t2
	 js46zUp4JLen2Eb5KhDwDZNYXfmrfg5AseV82YazUXnCGJRezGms9g1t4kQiwegpaiHcGXcqg/3k
	 thvxyZZNQ+ZcGukRW+epUEFqmAGF/dygt3RwEgGmQidrZcT7WJT+HgXSyDjqyRagIq2CDCxtpkos
	 P2XNXLJduo3SDwQQivhqexLe1TRFxYZDRH2MtA5khZghw0hyo8qBmMhQPYwq6LiOIZGerDeC4EdO
	 al+6c0rImhqw/Xuw5uRF0ckjCiGOVJHQm4Xdb1RWDC6Ux8daYVUSNachvifQTDN80JJXGACo6929
	 UBfx49qN+UGuG9Cy21auKqwdsFRMkFnIKrvInG1e8lzEWHWqTdku+QF/ChuIxnyEyHkaMVV9nMlj
	 DhqbFr2Qk7pZwFAReIqVdo+sWKeC4hzwTy7fnGCxKCZG1ykMzJR40AN6+aEBg4W2NOVowYlFAnkC
	 oLWc8uL7Mxcbm/P+oWRhqI+DHvazqGvXDuyOiLx+lOX/++28ebuDMCDH0LtpGkaZDypUcnU3qjnT
	 gr9gvpr6NCdg94qSzn/wZ1qumlx9bYZrdWiNJU6aWzxg0gkllaecX2pW5X+hLJjDyUKSynGwqJx1
	 wMc7icUWXBVJxkZGZ6sMaGuWJ7h0Vkk5r52XMb
X-QQ-XMRINFO: Mp0Kj//9VHAxdQrPcxjHCuGmF+tfZ5sAWg==
X-OQ-MSGID: <4ff968a4-a71e-42b3-af44-6365e37a5afa@qq.com>
Date: Tue, 20 Jan 2026 01:55:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: arm_scpi: Fix a reference leak on device node
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <tencent_A3E20C513BBE7D268B863A5CE473FBA10B06@qq.com>
 <aW0xWZ-KylipPF7M@stanley.mountain>
From: Felix Gu <gu_0233@qq.com>
In-Reply-To: <aW0xWZ-KylipPF7M@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_175640_801355_48060468 
X-CRM114-Status: GOOD (  12.81  )
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

Hi Dan,

Thanks for the review.

I found this issue through code review.

 From the comments and implementation, I believe this is a problem.

The caller often misses calling of_node_put(), and I have found a lot of

similar issues in the driver code.


Best regards,

Felix Gu

在 2026/1/19 3:15, Dan Carpenter 写道:
> On Fri, Jan 16, 2026 at 08:54:39PM +0800, Felix Gu wrote:
>> When calling of_parse_phandle_with_args(), the caller is responsible
>> to call of_node_put() to release the reference of device node.
>> In scpi_dev_domain_id, it does not release the reference.
>>
>> Fixes: 45ca7df7c345 ("firmware: arm_scpi: add support to populate OPPs and get transition latency")
>>
> nit: delete the blank line after the Fixes tag.
>
>> Signed-off-by: Felix Gu <gu_0233@qq.com>
> Did you find this issue just by reviewing the code?  I read the comments
> and then looked at a sample of four other callers and none of them
> called of_node_put().  So it's a weird thing.  If this is really the rule
> then we should have a static checker heuristic to enforce it.
>
> regards,
> dan carpenter


