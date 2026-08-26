Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFB7C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 14:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0uPE4rG9Kkem3MpmSNpLl7EPri3OY20t+UV6rkiyyc=; b=2Ot82BK5QZXZLQw2euSVl8I3rM
	NPU6lnuIHHXyi4vJ+RzRloJWmscxkjyjOhkomXPfsZ8CvkSWVY22AMT9O2agrJ+6LBHIAmPjMPBkm
	zijwfFFLjHkMJZHzFlRVx9NelrlOES85OBt5dPKRVPLvuQgXDcC12CEAIoTI0/0x2tnHNDEORgs3w
	Ylza5M84DcQwJuLLKD1g3aRJfV28zQVfzrQ+8NjtEHqzCgHGP7IpQ+agmII85+gHZnZxmfjdropmT
	rvnn4mK0NruV45OVnhpiW2CmicNr3GLRTBEYWmpCyg02zDfMNA0aM7d6t3I5YO7+yNlUfpuZNSlJA
	RWbGgKuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzERO-00000002aFP-0iq0;
	Wed, 26 Aug 2026 14:17:22 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzERI-00000002aEW-2wBy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 14:17:20 +0000
Received: from ehlo.thunderbird.net (93-33-80-53.ip43.fastwebnet.it [93.33.80.53])
	by mail11.truemail.it (Postfix) with ESMTPA id 3289522746;
	Wed, 26 Aug 2026 16:17:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1787753829;
	bh=h0uPE4rG9Kkem3MpmSNpLl7EPri3OY20t+UV6rkiyyc=; h=From:To:Subject;
	b=j45sn/6t0w6wDMppM3heS+Z5PQ1Qm7PgQFhKzWeWz5PwhL9Ck7oSlbOqTikN6bO3A
	 3AIpQHRx5VnefXy7OHo0viCEeOqy4vNT23zNn1f549AP5P9b4YONPE21xfjWyWg1ow
	 hs4/YOfBDHyIEJdykjLyqTbMpsRuXYPotb53gVNLcw2h3OrkoBE3vjDaUmXfO/4bxr
	 KvCM1Nt3PeMEXAN7vdHX/wVXet7SAU9XhXDOjdUcwYhSr0xJOCsWIYh67kqWtdy6za
	 J2mlaHh/BBToVp82wP84fjJU5RO8vVFKkUJd/Jga+6NeIJqyzes7UmD3BWLwNbmzgu
	 vVnkzVnMu5Dog==
Date: Wed, 26 Aug 2026 16:17:07 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Leonardo Costa <leoreis.costa@gmail.com>
CC: hongxing.zhu@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
 bhelgaas@google.com, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, regressions@lists.linux.dev,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 leonardo.costa@toradex.com
Subject: =?US-ASCII?Q?Re=3A_=5BREGRESSION=5D_mainline/master=3A_PC?=
 =?US-ASCII?Q?I_link_creation_fails_on_Apalis_iMX6?=
User-Agent: K-9 Mail for Android
In-Reply-To: <04454db7-0779-4a7f-bab2-72fea3480dcf@leemhuis.info>
References: <bl7i3obu2clzsgeoct2a4mtfhv6typcjdqmgneropf3hpgwve6@n2m5uhlduw57> <20260810211209.GB4821@francesco-nb> <04454db7-0779-4a7f-bab2-72fea3480dcf@leemhuis.info>
Message-ID: <67392DCC-0927-4BDB-85D7-7CA0CDF9EBE2@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_071717_807684_EFBCF4C7 
X-CRM114-Status: GOOD (  10.61  )
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



On 26 August 2026 16:11:46 CEST, Thorsten Leemhuis <regressions@leemhuis=
=2Einfo> wrote:
>On 8/10/26 23:12, Francesco Dolcini wrote:
>> On Mon, Aug 10, 2026 at 02:54:45PM -0300, Leonardo Costa wrote:
>>> We are seeing a regression on Apalis iMX6 where connected PCI device
>>> links fail to come up at initialization, as shown below=2E The issue i=
s
>>> not on the devices' physical connection, as they worked properly on v7=
=2E1
>>> and are working on other stable kernel versions=2E
>>=20
>> just to make this more clear=2E
>>=20
>> 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling regulators")
>> introduced a regression that prevented the boot=2E because of that we w=
ere
>> not able to run any of our test in our CI/CD
>>=20
>> commit 7678e81498e2 ("PCI: imx6: Fix i=2EMX6Q/DL boot hang caused by im=
proper PHY power sequencing")
>> fixes the boot issue, but now PCIe is not longer working
>Just wondering: what the status of this regression? I feel a bit lost her=
e=2E
>
>It looks like people were really keen on getting this resolved for 7=2E2
>-- even multiple revert were considered, but not performed in the end
>(not judging here, just mentioning it)=2E Three days after the quoted mai=
l
>(and thus even before 7=2E2 was out) Richard Zhu posted a fix afaics:
>
>https://lore=2Ekernel=2Eorg/all/20260813095003=2E356062-1-hongxing=2Ezhu@=
oss=2Enxp=2Ecom/
>
>But that still sits on the list and did not even receive a tested-by=2E I=
s
>it not that urgent anymore for some reason I cannot see? Are developers
>waiting for test-results from affected people? Or did this fall through
>the cracks?

It did fall though the cracks=2E The patch was tested before being sent as=
 a formal patch=2E
We are just waiting for the maintainer to apply it=2E

Francesco=20

>
>Ciao, Thorsten

