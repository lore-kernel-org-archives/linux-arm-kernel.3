Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E02D105F7AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S5cdo3WhwVWSx8oK/+KVY6wNy0h0dMfc9fwGQ8f5+Cs=; b=ShvTobIniCyOniMi1UWsz4qaD5
	v/7Dwg+4qkqIK2n4QOMwWVhGgY1J6p4vORznap1pu/jUG1Y+vc1fUMfo5NxeRAkSiEh799nsyr8jF
	8TxTmz/uLrU73/51mFU/UKL6g+RDxxfa/tcDfAUllYgNO0rhzyN9eWomHjOvesNKpskh5jJka6H2P
	91JZiDHjHisJUwkEUPoARjhDlc6QAP13dhC+vvR7fX3TN/KcnUoTvzwlP4FW8B0JOSLRLEiLZgo0J
	7sTFarkN57Jg/w0OObdhh332ilCuxAPA5SwPTkm2XITGrYGKuOOtXW6o+EU0K3Kwy8Oo8xeMDMP6n
	5HzxZ1NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13fS-00000000PMG-1wZL;
	Fri, 13 Mar 2026 14:39:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13fP-00000000PLP-1OS7;
	Fri, 13 Mar 2026 14:39:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B8274441F;
	Fri, 13 Mar 2026 14:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E677CC19421;
	Fri, 13 Mar 2026 14:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773412746;
	bh=2bB1TNHSstKP1SyOMwkXhCnminoEDQyrDqJ+oh+TkPk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=pki7ElTugXQ1BdVOTQYUeJa13U8nnQfK7wm0vdtU5qKMDsBi0S0S/ByChMXQ8na/o
	 2zqhkK7jAWK40WCTqBKxN4MV3ujCYogeT7bY2vVdN+nfWUh+9IKT1mUgGouYH+DNib
	 Z8aGV56v7VX8VTx/dKwZs+MhjNbxmQyhf3pp8Xp56K8y8Mc4YjT9xyb108eKAQ68H8
	 ycoCOcU4a2WZzgJpPZsuUr4B/KsRNxF5f5+EkaljVyQBTV+wgFffabk5+m7c/hdEsz
	 Om9m3HdKkP+jvq4uyquP421v/CTSb5eYAOexGAdz8fo6rYCk5M/Z/KBCl+Ml+GWnb5
	 qMi2nPna2lQCQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 15:39:00 +0100
Message-Id: <DH1QCLS89ADR.3H0XABP0GEFQT@kernel.org>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
Cc: "Manivannan Sadhasivam" <mani@kernel.org>, "Manivannan Sadhasivam"
 <manivannan.sadhasivam@oss.qualcomm.com>, "Lorenzo Pieralisi"
 <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Heiko Stuebner" <heiko@sntech.de>, "Niklas Cassel"
 <cassel@kernel.org>, "Shawn Lin" <shawn.lin@rock-chips.com>, "Hans Zhang"
 <18255117159@163.com>, "Nicolas Frattaroli"
 <nicolas.frattaroli@collabora.com>, "Wilfred Mallawa"
 <wilfred.mallawa@wdc.com>, <linux-pci@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Anand Moon" <linux.amoon@gmail.com>, "Grimmauld" <grimmauld@grimmauld.de>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, <driver-core@lists.linux.dev>, "Lukas Wunner"
 <lukas@wunner.de>
To: "Robin Murphy" <robin.murphy@arm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260226101032.1042-1-linux.amoon@gmail.com>
 <177260693908.10259.13055467642416391434.b4-ty@kernel.org>
 <87bc37ee-234c-4568-b72e-955c130a6838@arm.com>
 <f7tfshf7riljjibuqge4ubfjmludubpyh3ppdf6lasurzdzbtj@sw4xxagfhnn3>
 <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com>
 <qwanhqrpztzkudik5fmberhabnzaly7v53677dohqzj5nq4wi2@6ndpiubyxcbi>
 <DGZXF3LPSRK6.2QYN63QTKUQAX@kernel.org>
 <cp5uktfqdf6zs53qsye57ior2ikmssgevxxdtevkzpisaif22h@7mrxspkuibow>
 <DH09EDBW3X6T.2996UB1CFCAW2@kernel.org>
 <55c28218-1638-4b90-a9cd-a177fb5abcb6@arm.com>
 <DH0TM60TVX5D.20W4O1X696ALA@kernel.org>
 <6cfe4bda-036f-4bb9-8a08-ed75f61cae24@arm.com>
In-Reply-To: <6cfe4bda-036f-4bb9-8a08-ed75f61cae24@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_073907_456125_D27797F4 
X-CRM114-Status: GOOD (  26.07  )
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

On Fri Mar 13, 2026 at 2:15 PM CET, Robin Murphy wrote:
> On 2026-03-12 12:59 pm, Danilo Krummrich wrote:
>> On Thu Mar 12, 2026 at 1:48 PM CET, Robin Murphy wrote:
>>> On 2026-03-11 9:09 pm, Danilo Krummrich wrote:
>>>>   From a driver-core perspective I think we're rather limited on what =
we can do;
>>>> we are already in async context at this point and can't magically go b=
ack to
>>>> initcall context.
>>>>
>>>> So, the only thing I can think of is to kick off work on a workqueue, =
which in
>>>> the end would be the same as the deferred probe handling.
>>>
>>> Hmm, in fact, isn't the deferred probe mechanism itself actually quite
>>> appropriate?
>>=20
>> Yes, I've also mentioned this in [1], including the fact that it technic=
ally
>> even complies with the guarantees given by PROBE_FORCE_SYNCHRONOUS. I.e.=
 the
>> documentation says:
>>=20
>> 	Use this to annotate drivers that need their probe routines to run
>> 	synchronously with driver and device registration (with the exception o=
f
>> 	-EPROBE_DEFER handling - re-probing always ends up being done
>> 	asynchronously).
>>=20
>> However, I'm still not sure how I feel about this, since I consider this=
 to be
>> more like a workaround that just moves things to a "more approprite" asy=
nc
>> context.
>
> I guess the underlying problem there is that there are at least 3=20
> different significant aspects to what "synchronous" can mean:
>
> - literally in the context or device/driver registration as documented.=
=20
> Off-hand I'm not really sure what useful property may be *specific* to=20
> those conditions that a driver might rely on, other than for=20
> super-special cases like platform_driver_probe().

I'm not worried about this one, as it is already special by not being compa=
tible
with deferred probe. I.e. the caller already has to promise that the
corresponding probe() call will never return -EPROBE_DEFER.

This is a much more error prone requirement than just "don't call this from
async" already.

> - serialised, i.e. probes of multiple devices won't happen concurrently=
=20
> on multiple threads. This is probably the one hiding the most driver=20
> bugs, e.g. internal shared/global state without sufficient=20
> synchronisation. I guess this falls out as a side-effect of the first=20
> condition, but AFAICS it *can* also still provided by deferred probe=20
> (given that it's a single work item iterating a list one-by-one)
>
> - in some regular thread context that isn't liable to have issues=20
> synchronising against other async_func workers (i.e. the request_module=
=20
> case). Again, deferred can't have a problem here, or it wouldn't have=20
> worked properly in general for the last decade.
>
> So it's not that we'd be relying on some dubious "deferred is always=20
> synchronous" assumption - AFAICS deferred *can* launch async if the=20
> driver permits it - more just ratifying that deferred is still able to=20
> effectively honour all the useful properties of PROBE_FORCE_SYNCHRONOUS=
=20
> other than "during registration of the thing".

Yes, and as mentioned above, EPROBE_DEFER has always been a valid path for
PROBE_FORCE_SYNCHRONOUS, which is why I brought it up as a a workaround in =
the
first place.

(The reason why I still say "workaround" is because nothing actually needs =
to be
deferred.)

Anyways, as I mentioned...

>> On the other hand, eventually we want everything to work with
>> PROBE_PREFER_ASYNCHRONOUS, so maybe it's also good enough for the time b=
eing.=20

...plus there are not a lot of PROBE_FORCE_SYNCHRONOUS left anyways.

Do you want to send a patch?

