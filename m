Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F44CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 14:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Ho2IoV59LwkMD+Wa6e3K4Vn8fLL93pSqnoD57gbJEU=; b=MUI3lxja4H7R1ja8QbTIl819RW
	Oxo3Ci5En7f6kZYdD10geHXKh8kYK/uRpHKiFM1RUVaUW70N+qzwxu8Tenzaf7PwvMqWCMa24390X
	xIEIaG0/+4Pcw45Vk/qZ8mnEkETd45Vr8qZOmN/9skM9apShuh1tfh5intAwhKhFJiGRzT1NMpYvU
	H4BE2Viu6a5axMwUv8zs1Y4xtoYtIUpqr1lnGPsLjnFSb99NbC4RIFp9FKOU2zJ1bDFLFUc9idQDz
	pv4CmnzXusw3tJyvXBlP1FcluUkcQzQXgnnzR4gb30gyds6oWR3qhN5MVj4vUDMSFuEd4cu/RBwpf
	GK0ZFrtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVyH-0000000HNpJ-2rc8;
	Mon, 25 May 2026 14:07:57 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVyE-0000000HNof-3vp9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 14:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: Subject: Cc: To: From: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1779718073;
 bh=2Ho2IoV59LwkMD+Wa6e3K4Vn8fLL93pSqnoD57gbJEU=;
 b=IXduTA2s4V4sLkEQHkNFX2pXACy/KU9cYjEMOU5bWy+lFNVbZKI+qc09amJw+lSWrWNvGqyrt
 +dLXVeo2M1ZImCGKq3WojKgvP/DZaxqJ31Mfl9dHQEcwem4SUnCzsDU9DSTklbRRHhVhXc4YlVB
 5pk2SLqLCr35q5HlJDMY1wHeZE6aSziUiHNmxe55z5nrivtcp+RpX1H0NRR3ymCcuI9Dc6axoRj
 19kAas8i8JbYu67GV9Z/sPddqucXxhK8c3NXM8xk3tYJW6glFrUVqSQIOsCYXRX+463uIkzqoPU
 VlU3Z0IJSc6FIX66ekrcNV53Pbwe3I8ovikh2hiQ+knw==
X-Forward-Email-ID: 6a1457b79efc2641fb7d3a63
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.15
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Mon, 25 May 2026 10:07:50 -0400
Message-Id: <DIRTEIGVL56X.1W49YU67DXNUQ@ubuntu.com>
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sasha Finkelstein" <k@chaosmail.tech>, "Joshua Peisach"
 <jpeisach@ubuntu.com>
Cc: "Sven Peter" <sven@kernel.org>, "Janne Grunau" <j@jannau.net>, "Neal
 Gompa" <neal@gompa.dev>, "Marcel Holtmann" <marcel@holtmann.org>, "Luiz
 Augusto von Dentz" <luiz.dentz@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>, <linux-kernel@vger.kernel.org>,
 <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-bluetooth@vger.kernel.org>, <netdev@vger.kernel.org>
Subject: Re: [PATCH v3] Bluetooth: Add Broadcom channel priority commands
X-Mailer: aerc 0.21.0
References: <20260525-brcm-prio-v3-1-6259e10233f8@chaosmail.tech>
 <DIRT7260SRQZ.1BFF8CX3FJ57G@ubuntu.com>
 <172D11E7-AF98-43F8-B41B-907738749EA5@chaosmail.tech>
In-Reply-To: <172D11E7-AF98-43F8-B41B-907738749EA5@chaosmail.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_070755_068592_2290F5FA 
X-CRM114-Status: GOOD (  10.99  )
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

On Mon May 25, 2026 at 10:05 AM EDT, Sasha Finkelstein wrote:
>
>> On May 25, 2026, at 15:58, Joshua Peisach <jpeisach@ubuntu.com> wrote:
>>=20
>> On Mon May 25, 2026 at 8:11 AM EDT, Sasha Finkelstein wrote:
>>>=20
>>> + cmd.enable =3D !!enable;
>>> +
>>=20
>> Probably a dumb question, but worth asking - what is the purpose of the
>> "!!"? Wouldn't just passing "enable" be sufficient?
>
> This is a way to enforce that the value is exactly 0 or 1, not 0 or non-z=
ero.
>
>>=20
>> Also, currently, cmd.enable seems to just be set and used in the case
>> of boolean conditions. Would it make sense for the enable field in
>> brcm_prio_cmd to be a bool or does it not really matter?
>>=20
> Opposite, actually, this struct is fed to firmware, and it needs to be
> specifically a u8.

Got it, thanks!

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>

