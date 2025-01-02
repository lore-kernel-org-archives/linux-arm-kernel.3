Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BADE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 19:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KcV3QFI2ZE9ECVzD528IkAqVHoxTiKTsGIDJy3xVsvM=; b=3TsH+IW08HHK9G
	JMksA2vTuOkfs9shX8PC412lJ08rCeuePqJstGOkcmnR0NGHcDpI4QxGeQS92SawQuQTmfpQEUASj
	5X4z/gzBtr+GEu8XVKl1c6+YleXwa1SaxEGgxqXRSR8QfATa7CFIwdpGG9DA0gDQ80E15+5wftaIr
	C28zpR+vAdZto7Z106CM+mfygwjWf52lRoxZEQ3Wv5s58vlqhixxkogXb7Zf1VgHXQoPa0nXG/dkt
	QpS/Neo4E89cG3KnEV3xHsj2ON45MV3yDy/6gL39SU0DqQG5UvX+09YrNHoka15jaNUr0BcGXevel
	OwMgTeAMW6JuOFteHUuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTRJ5-0000000BKvs-0FQE;
	Thu, 02 Jan 2025 19:56:35 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTRHu-0000000BKiy-2zGd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 19:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1735847712; x=1736452512; i=frank-w@public-files.de;
	bh=KcV3QFI2ZE9ECVzD528IkAqVHoxTiKTsGIDJy3xVsvM=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=h6oRgOk6ZNkYDhRNkoG2zeNZ2Lmgz3oWfomuONVuXw22Mr/zQNG+xUv8/spOn38J
	 YSGTcjA1gom7pV0jlZMUyfVmEXUYylwXQuc3jlRWrsy0Au8Qo+w0gqL4Y7OFNs7go
	 9dw64H9s6f+pNAucoxWaH/ekyU1COyTbY21fmqoDccTt6K7+c71eAeMA76CM+Gt1E
	 eOv7D/9B3fICOF7OnMB6PKqnim++vgD9TG9qtdvpANcQcsuyk4jQY4TzWf8r/kmK3
	 VRW/GEz/HRe5J+UYOYqpZ4OCCWiSIeoRRz0q7z6SIUJZ1kxCXJtgoOpr7tK7jNzao
	 b5lXMQ9pp1XD9OZIng==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.61.146.33]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mq2nA-1tojPG2a4w-00ZFua; Thu, 02
 Jan 2025 20:55:12 +0100
Date: Thu, 02 Jan 2025 20:55:11 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: Rob Herring <robh@kernel.org>
CC: linux@fw-web.de, dlemoal@kernel.org, cassel@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrew@lunn.ch, gregory.clement@bootlin.com,
 sebastian.hesselbarth@gmail.com, linux@armlinux.org.uk, hdegoede@redhat.com,
 axboe@kernel.dk, linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_Aw=3A_Re=3A_=5BPATCH_v1_1/3=5D_arm64=3A_dts=3A?=
 =?US-ASCII?Q?_marvell=3A_Fix_anyOf_conditional_failed?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAL_Jsq+PEdH1b-aoN2nFJMRz--abXPqZ=sftPnhYKWpj0VjroQ@mail.gmail.com>
References: <20241109094623.37518-1-linux@fw-web.de> <20241109094623.37518-2-linux@fw-web.de> <20241111203611.GB1887580-robh@kernel.org> <trinity-796b046d-1857-413e-bb82-78e700d6b5ac-1733138371404@msvc-mesg-gmx005> <trinity-a84b41b3-79c5-49b5-9786-eb89f85578cc-1735843472332@trinity-msg-rest-gmx-gmx-live-548599f845-gxsb9> <CAL_Jsq+PEdH1b-aoN2nFJMRz--abXPqZ=sftPnhYKWpj0VjroQ@mail.gmail.com>
Message-ID: <F92E6B5E-CB0A-429E-821F-FC87C3C69C29@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WaaUNduwprSo8Rw2SnSLhhl/4G//xG/JBxkJqQG5R9Yowcif2OF
 MkDtmqWs25NQE2Veorx1VPAni9E5ksLAwPtTAE5faFFVb1wBN5PLx2P43TXr0lCs7XFGLfC
 AsynmZgsxuLpHOGZg99SZJO0zTxoiOvXE7qQH7wZ1S9A8BmpeyzaYrwTrvgdRFYU9opIGcZ
 9MXrlSGD+vTfo8FE+ju0g==
UI-OutboundReport: notjunk:1;M01:P0:lig0t4PBHRA=;FoPrt7xYqPzS5KqeMUqAQD+3Dct
 GQsK3oPzFoo2Hq5JM/C9rWIqOR3ye2OxHK74lF7ZFvi8Xdwhz3wQfTqi/6mwJNwPrnMqK9v6q
 IIJTYUhjCOzE3Hs1QJDoZwiTwRskuf1Yzpz4zspl6hRxCavWVwfd5SQzUyT1ZoHuXDSuroUbW
 pqURl3nfNQTy9snvTHAsqg7uA2vu/RMnua33Qfz2xPsBnJS1WwZf3HUe9u1w+N1Qqv6myHMHa
 Ym1yY2GDMhoyAsg+Iy1Q+6J/feZUPHhQ+arnWExSsgwwDRFodnlDM6DXWG3gBQuWTQlALWmvS
 v01LDYZABcXDjmv2iRup8TYjNAm/gHjcvtCwAekUfcmvW8JsRL14HvMJLcTqwnZ+jxt0v6Ukn
 b6ess/UOH34Dyzi54lhKCfxNIF2fzuY7QVUxTkuqwRsoOts6bOqIyNJlb6qX6wbnoJa2HBJxJ
 zM5sAaLIGHqQT18rTsp3Ebc1tQQn4gmpuxfoO9NYhfLQuBBp5ZBM6F2WVfbajfcPvmXmypCLu
 r4Vo4mJb6S65S6t8Gnpp5YwbL9YSrWnxJn5iCd00GaN6jufZEmwY4rGsiq3r7VnDCwHx/oa+J
 Us86+hG0N4AmDZEOluO1V2vdsaBfEIYMzgW2dNI/NbGM7bl4tmGF9h0ZBRG3uBe1dUXeNroPY
 zxeIm7G9ew7SIVr0pyd58QP959Cci0RK/Pc1a8S1ikXYkHB7JJ1B6ftyItRCvxnMYuoeGNiON
 NeBGWr0vp1PIB+31PjZ6KG70RVw4dpcfNBwow79XmU/s3VigblwXk9fD47VViZNwiO+iofxwQ
 PxSEOM8DJTu84UyPpRddsrhAFWbA+sfuVYu3xs5i1MIGpS0lrNkU7x6i5N26ZywzJoP6p5yPv
 HuR1wbW32LjBpdDcfZAzHQ1H3QtcErQZlyQAJgpaVv4dqDh5c986jkiR5Yu1Fdp3N8vHlWztH
 t1iDBvB4WRC5B+P5V9m8z7trJ3mT0WX/f1VJZtBvQ/JLyzpQrJDE+PLDw7Nk3k6tzy+0cyfLN
 zM/Fc1N9GWLjWY5nCK3iay33mAhTl3xUAFzDWfYPnIcCBDLoXhcrsrLlQ22IwQ02yN8++qNFO
 THZfG8FsskEYg7JskHeHRkWqBvxLSv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_115523_045361_1532C9FA 
X-CRM114-Status: GOOD (  11.09  )
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
Reply-To: frank-w@public-files.de
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Am 2=2E Januar 2025 20:46:05 MEZ schrieb Rob Herring <robh@kernel=2Eorg>:
>On Thu, Jan 2, 2025 at 12:44=E2=80=AFPM Frank Wunderlich
><frank-w@public-files=2Ede> wrote:
>>
>> is there any new state here? got no answer for my last 2 Messages
>>
>> https://patchwork=2Ekernel=2Eorg/project/linux-arm-kernel/patch/2024110=
9094623=2E37518-2-linux@fw-web=2Ede/
>>
>> sorry for the html-entities=2E=2E=2Ethey came from my gmx webmailer, it=
 is reported multiple times, but i cannot do more here :(
>
>As a maintainer, when I see any discussion or comments, I drop the
>patch from my queue=2E That may have happened here=2E It is best to resen=
d
>if it's been more than 2 weeks=2E Though Marvell maintainer response
>times are often longer than that sadly=2E
>
>You haven't addressed my comment either=2E The subject needs work=2E If
>you don't like my suggestion, then come up with your own=2E

I have addressed your comment:

>> Here and the subject, "fixing anyOf" isn't very specific and is just an
>> implementation detail of the schema=2E "Add missing required 'phys'
>> property" would be more exact=2E
> imho it does not match what patch does=2E=2E=2Ei do not add required phy=
s=2E=2E=2Ei just disable the nodes and enable them only where phys is set=
=2E

But maybe i can name it better=2E

Maybe something like this:

"Fix binding error caused by incomplete nodes=2E"

>Rob


regards Frank

