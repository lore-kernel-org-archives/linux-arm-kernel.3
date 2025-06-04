Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBD5C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 09:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIYky3gjpTsCWWoJfEf+lc/dCW5mVapm/m/j24bH0IQ=; b=T1DiKucoAdslyWj7Szoltct3wF
	L07ssYlP8Wmkvxml1C3SvT8weIAfJIbqsOsAeNZb/WAAlnTw5uTNJ/Wauh/UEQS6IpONEsLYl/Oz4
	ANLwHWw07GudBJ0+pkC5Cp04dYrunUJfkBWzsCh7sY3U6f89r0awHPUfSxIgAVkh4zuEa30YrQcJF
	NpPWEqELEM/6uvnE9ZEsMrm5JZwOoZRyl2OZNttl2wBJDCZiGHULssrPUBE7IUW91XwijqzydzXgP
	PDf4QwUnqZdpZGvpBJ2IA6hyuaLU2Fbf1KuvWVZHPKZwISpR2WIhCxf3qIOtaB/jh2OCduxlZ1ueG
	ej/d2F3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkCc-0000000Czjo-3ThA;
	Wed, 04 Jun 2025 09:14:30 +0000
Received: from out203-205-221-210.mail.qq.com ([203.205.221.210])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkAV-0000000CzRl-00Cp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 09:12:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1749028327;
	bh=RIYky3gjpTsCWWoJfEf+lc/dCW5mVapm/m/j24bH0IQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RvfJeaOjVTb7Of+8+ew2DkSYNg+7b58Vk8r8FKbC4BXsnQArGCmWRipHe7pGwqHno
	 lT3sv9Qj1BF4uH+DCmxF2iGQPr1DxyQldOAGHj1GcoFxKaJ6ag0OAcqSC3MWW4I76E
	 CQn6KrV2Ph1d4Ljzeqwrpn3RIW5YL2CxtoZaaK94=
Received: from [10.56.52.9] ([39.156.73.10])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id 30098838; Wed, 04 Jun 2025 17:12:00 +0800
X-QQ-mid: xmsmtpt1749028320tno68hupx
Message-ID: <tencent_CC0310590D7085E8B3EC2E1955E45E4B4709@qq.com>
X-QQ-XMAILINFO: NvKPbWBbh1DVYUNrtUaO4h9Jj+nOhO0LDaL7Td6QvGV4lWUff2j/vEKUwNnLFs
	 OLHiU8HjtO7X0BTo/mZpmoEGAb9JuMxziyE13yu5EmANI/1w0vmju9epZ/bZzbSXA1flXKOlJCZZ
	 0xdvAOAB8VyNKr2QluATxTOYVEe1IAEr29eygOc9y2gqvHEs7zbaNV8svwb2YcQomlJh10O1DWLo
	 PXJrtg35/w2KjVub9G4hXlaaODVaIv5HxLJLIeGw8haZVbKol3pxT1UVrVP9PIE6iW6oGW1DASKk
	 JglRxN8iFlXFrH408POil0NYTrv4Qls947B0al8UFnJ6xeYWFPfvmK+l6mw3Cl/4BLpWgDOMRt+k
	 UrYDh0qAZTVf2FDZg6dIj2VABZbbalypmmpKQdY8zk4jeja07vCJfEocQCBNTybGixtgoKvRvcd0
	 dSUcqfu9AgFxz8oM4ks2OZfJVc/+1YSKiZdZ5oWg4JzNvrD9IgDKripzGOCf2gfOXHhj67JKwtdc
	 Xvt5qdrp6RIu3qv8q79nDMT9pBldnw+GpvGZd/GLfkykzwt4ZRmcEt2ADl0Bj/tfDN1XajAgi+NF
	 AsgwcY3cJtX3K3Gh0WXK45o4Zof4kxKsygFeKzZU7NXl28+E4sH5vCLV4aIsOknG4m5D4CDUYdkm
	 ac+ZcB+WCWf2D8wX5w4fMtWUtYNjW7X5EOQolpYsuNItcckXyWQP4hfCMgfdHYjzdbYS0UlIiByU
	 buyWQSQCSzDpvNini1IwsOxoHQ0QcHWYCf9zveyqN85O1YLWoGw3uO39Vd/oSSS+IDCnTmE0vPoY
	 owrNAXU/M0Msa9kRe2HGy9sJT5ME7CAy1QM/JX+1nQtOq0ShztSqPRXhjEkQ1Q9NeYf8YE416HyZ
	 z06m9cTiKe6VUYzTY0knFb75smemeGwBRoXSxAC2fADTT93GciJy/QFtVo0WJYjvAQga58hOqboM
	 8qdx5zDNtzNRgK0zCw8mhNrpqwX8kASut9RkRk/ypcFd0xG05u1ALrQq/VzpXCpTMwV84eDOcSsO
	 PVaspGNOPthDgcgF8X
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-OQ-MSGID: <365843f4-d33d-490d-b567-fe9250577725@foxmail.com>
Date: Wed, 4 Jun 2025 17:12:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next] selftests/bpf: Fix compile error of
 bin_attribute::read/write()
To: Jiri Olsa <olsajiri@gmail.com>
Cc: andrii@kernel.org, eddyz87@gmail.com, rongtao@cestc.cn,
 Mykola Lysenko <mykolal@fb.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Shuah Khan <shuah@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Peter Zijlstra <peterz@infradead.org>, Amery Hung <ameryhung@gmail.com>,
 Juntong Deng <juntong.deng@outlook.com>, Oleg Nesterov <oleg@redhat.com>,
 "open list:BPF [SELFTESTS] (Test Runners & Infrastructure)"
 <bpf@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <tencent_A6502A28AF21A3CA88B106F3421159869708@qq.com>
 <aEAJbBH00yL2iTgn@krava>
Content-Language: en-US
From: Rong Tao <rtoax@foxmail.com>
In-Reply-To: <aEAJbBH00yL2iTgn@krava>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_021219_412924_F15756FB 
X-CRM114-Status: UNSURE (   7.83  )
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


On 6/4/25 16:53, Jiri Olsa wrote:
> On Wed, Jun 04, 2025 at 01:53:22PM +0800, Rong Tao wrote:
>> From: Rong Tao <rongtao@cestc.cn>
>>
>> Since commit 97d06802d10a ("sysfs: constify bin_attribute argument of
>> bin_attribute::read/write()"), make bin_attribute parameter of
>> bin_attribute::read/write() const.
> hi,
> there's already fix for this in bpf/master
>
> thanks,
> jirka
I am confused, when should I use bpf/master[2] and when should I use
bpf-next/master[1]? thank you :)

[1] https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git


