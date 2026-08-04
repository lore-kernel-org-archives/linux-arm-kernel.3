Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6D7C55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yeDxhag+TNNWASBx4n6SWled1gX7BxGiMg6M2Cvsz6s=; b=4BH+7XWNEdzVSyxkCDviL4KYLQ
	hpEXsJxATklc/MzPnvpw7UtQewGaLY8109uWzGJdKHGX5eNFbVK1WsqMJcKmte2LplUERjm31KlMW
	17admZGB7tQIk770MQNt6ocvEPN+XDNLFxCeSerfWXz14qYUEDfI/o1F6vaANmB57w6dEb+u3O63c
	D+jdr4fLo1I/DM+ZggX2CS2LFhgECvgprzl6Hj19m0QCc/a7kZHPXZ2o6+mRfF771VjN90MVLl6JZ
	ISLPt1zkTRAkp2ODTxy3MrRXPulNoUND5Tq4smkv+mXfpkrstWelSSeDvKZN3HRqXnHzaSozLxV8I
	wbSk+EAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrA0I-00000001H9K-2ppd;
	Tue, 04 Aug 2026 07:56:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrA0G-00000001H8l-36O1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 07:56:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CB31E60A77;
	Tue,  4 Aug 2026 07:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8645D1F00A3A;
	Tue,  4 Aug 2026 07:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785830159;
	bh=yeDxhag+TNNWASBx4n6SWled1gX7BxGiMg6M2Cvsz6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LoJHrsID+TjLQwZyWHc6+v6F2Ih8Ys5ua5zUJ2D2M7Eml+bb1vCC0wqf1HKhf4Jd/
	 UWVRIf4n5chatnzsc4UesIRilitp/fYTiU8pINVwQl9G4qj61V6su7xetQIS3xL5RF
	 dS98ithodVC+XexFBZpPsjc4f8TeiiuK6t85jC27SGfq19KhIfJN1sD1+4mAAMaMyL
	 LNAaRqTnXVzUBkHYzytkm4rZUb1qg1Fttc6gPdc48K76vHjq1jHX7nF/tdMsOzSTMW
	 yatQvjwnJJ6Ns49pNqy7TT/XNXjcWYeruYisHUV6/eM7DM76uvqcZawfBeSe/QAhC3
	 X3raOFkE2IC2Q==
Date: Tue, 4 Aug 2026 09:55:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tzu-Hao Wei <twei@axiado.com>
Cc: Shubhangini G <shubhangini@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Karthikeyan Mitran <kmitran@axiado.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 1/2] dt-bindings: media: add axiado,ax3000-video
Message-ID: <20260804-healthy-versatile-barnacle-b58db9@quoll>
References: <20260730-ax3000-display-driver-v1-0-4fbd4d0c85d3@axiado.com>
 <20260730-ax3000-display-driver-v1-1-4fbd4d0c85d3@axiado.com>
 <ed8ca066-bb8b-4476-be96-37a2b6e022ab@kernel.org>
 <a8383bd7-802b-41b0-897b-812b4a8fca33@axiado.com>
 <9f689436-04c6-48d6-8342-7fac998f3910@kernel.org>
 <b585130e-710a-434d-bf06-cc06f9bffc33@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b585130e-710a-434d-bf06-cc06f9bffc33@axiado.com>
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

On Tue, Aug 04, 2026 at 07:31:25AM +0800, Tzu-Hao Wei wrote:
> >> There is no local register interface for this driver to program: frame
> >> delivery is controlled entirely by the host-side display engine and
> >> the PCIe endpoint mapping that feeds the shared region, both external
> >> to this driver. A software polling timer schedules a workqueue item at
> >> the configured framerate, which copies frames from the WC-mapped
> >> shared region into vmalloc-backed vb2 buffers. Running the copy in a
> >> work item rather than directly in the timer callback keeps potentially
> >> multi-megabyte memcpy and per-pixel conversion work out of softirq
> >> context.
> > 
> > Then this is not a separate device. You just described a Linux driver.
> > 
> > I still wait for answers of my question above. You described getting
> > buffers only.
> > 
> 
> Thank you for the continued review.
> 
> To correctly represent this in device tree without describing a
> software driver as a hardware device, would moving the schema into
> /reserved-memory be the preferred approach for v2?
> 
> Specifically, we are considering moving it to:
> Documentation/devicetree/bindings/reserved-memory/axiado,ax3000-video-mem.yaml

I would rather suggest this should be part of the device handling the
host side of the device. Or is there none?

Again, how do you configure the frame parameters or start capturing the
data?

> 
> This would follow the same Devicetree architectural pattern as
> qcom,rmtfs-mem:
> Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
> 
> Just as qcom,rmtfs-mem describes a reserved memory buffer used by
> remote processors and exports /dev/rmtfs_mem%d without hardware MMIO
> registers, clocks, or resets, axiado,ax3000-video describes the
> reserved memory buffer used by the AX3000 display pipeline and exports
> /dev/video0.
> 
> Does representing axiado,ax3000-video as a reserved-memory node look
> like the appropriate way to model this in v2?

So from a device we went now to pure memory... That's quite a change and
would prove this was completely bogus hardware description.

I actually fail to see any hardware here, because you could just
allocate whatever memory and pass it to your host, no? Why it has to be
a reserved memory?

Best regards,
Krzysztof


