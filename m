Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D058606D80A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 21:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xSZrDpPj;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vq1oRk+T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VHV6XZXV3oT+cCr5eIzbFOalP1E93sRXCTUPESAW1N8=; b=xSZrDpPjoVaqpyxpMt+jN8Ve/B
	r6ARaeTaaquSttKJRNBzdVVHuY3e6/o1GXpuoym+w31Xc4pND+agjaJl5mhrrkFz82/KIvoVzjExJ
	OiAGUhbK0K53Iockpy3IXFuBn2vq3nLUToQO4RN8yKrzyMZ3eoEhRkusfETA4KX/HobdteKfl373k
	KcFse4MMI14ZAO6fQNQ3AovAlhBeFjiXPPTLW0vqFy+/J/Wqxaflmm1ctBSjnc/Rs9S/wlB8FBTGN
	ngQwE6TH71yX8xKY2QJu/UumNs8abgIHwaPd+fZ5n1TnrDuQi6dwVoEDFhzlv4K6XLPYtFoEyor/A
	/R0lFiXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzhF-00000000UR4-01aZ;
	Mon, 02 Nov 2026 21:36:05 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzhB-00000000UQP-3vXy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 21:36:03 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-93f3c616c84so310020785a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 13:36:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793655360; cv=none;
        d=google.com; s=arc-20260327;
        b=dB1s05vgvqTqMFW5Uomu1DSbVtD+8rbzCHnstgjJ0eDskGH7CEOPLeWs/41meJ9Agd
         TtDDmxTO/OTwqMIgQY3iv3keMMDRS6h8BhGuw2IgYsf/gT4rDz8AUN23oVutZZWsusAG
         sf9PTDjizCWvwH1MTCkC8e4f1pXfiJcRK+bhgw5pyewbG3qI1n9lzaPfyBfMUfLWSN3d
         uk+Y3pcBsalofiX0dgPkj1qEq9kV5MlgnyLOzThF9JD2QjNThlsLE1d+3zvpEf5ojpf3
         zbqduAPOMF5IE79LnIe3UvtOa6E4WBVdnCOdurt5EkSweUN2vf/vtrzTYnlAiNAZ1W2p
         7EPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VHV6XZXV3oT+cCr5eIzbFOalP1E93sRXCTUPESAW1N8=;
        fh=gOjVGaMvZjeNtpU+VrdfDrNtc1PqMy3QiJJreIHwOt8=;
        b=kWiGLsqZ8fTResx5r1B0Aw11TkN8tA0odTLsccN95gyFweQVJjzkU8NTq1K/wWPs5F
         kI+C9//G55mH9MtxFGD9/FcRAeT71mugvmvA+SBeCdLrORJSCvWdI68UMAmH92TzjN+E
         pUJgtJdE9FEo+W6+eq89rRAnqF8ejauYujTrkR6+yo9XtpMoXbWxvv3AKDI4pWIZsHDu
         gI49xk2JWp7XiyyWZObr6eQKWtSwUmIzp11NfHuorBJvg2z43mTDyHoZ60O9KJxO97+a
         0a7ybgyZ2uX3vd4OBrLkfJ8mGjzrlX3m5I2ojiQM0oZAUpqIbPQ73GwhDzpkdNFjvb8H
         8bWA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793655360; x=1794260160; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VHV6XZXV3oT+cCr5eIzbFOalP1E93sRXCTUPESAW1N8=;
        b=Vq1oRk+TKUEoBIQ0htT1e1+Ey8hiPpUI3kpH0k4JbJF8+f2Q3iV4jBGEIgL9qACZd7
         SoCBsmpjY1FGCorp+F6qrt7an8J9iYqmgpiB7+21e/9yWsgjIbtfMAlU6DFvO4NI6C8c
         iglpVo/KUzTQqjH/po7i5fNnVApfPhj39YYZO42jBIsRx0SdFtMdCGu3WkZnEsFLWWkl
         nKvW4WQymxGUe9nlstNmal+zHHxbOcebw2UdV9mRfWwn26QcMO5xhKN9dqmkmtEGuW7U
         A2BL6oNINm8VHs/GO4W7+IR3kl6C7OvIYK6BIkS62b12NXpnr8ljIzttcNG36RlqJZre
         tTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793655360; x=1794260160;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VHV6XZXV3oT+cCr5eIzbFOalP1E93sRXCTUPESAW1N8=;
        b=PonFjIg+XBomzJeQp1dozf8Zb6buw713HKw5qgGNg4lEBE6bOyY8jaoVlZcN0Dj5ae
         roz8m7ct8g/hNVPHM09AmtZX2hArgV7raNYB1dgmRPBLAY+g0OU/cKSPAXyB6en4q8MU
         zqS3O98wL1enkE+DcVjazOBg3DzpX7/FhuaGETafVSXYz7MjTHVvEQVgwl/zH1ABNm+T
         /gt/Iqto+62VlafBuBLaCemJl7G4zOGmfqjI39o/CUGAupHmsgRCK1Yj4Gy+33rrq+vq
         dxw8MwlahuQDJfFxm7MKOHJquDZuM4B+EuUZWhg5f+a2RmQYNIBmmOe6qyR7Uw//+rs8
         uowg==
X-Forwarded-Encrypted: i=1; AKwUvBzpaVU90jG3uoIzBx3luRJBjSf1hYBJsf22SAyGfnbV8s8Zu9J7qTjAmAann6fO8Ax3h6hto/oWWOM0AnlFh1vS@lists.infradead.org
X-Gm-Message-State: AFq9FYJq2KzRbA44hxdPAfpqpmuVObPhAZ9k7Y+MwiaaWhbScDRTVnf8
	5w/3ojHqJjc5Ra8ITbxcS5sjbA6PTInBf+rwpFa73yyhSPrrjtkne36MF4KNwB9WWG38ihbJsVh
	diXnODlRvplCm6renz5g2boWDJnQ5bu0=
X-Gm-Gg: AYBFou3VVfJq99vhfsjLg6kYh8bviYBCrObwspT4PRy+n/vRs95Lz//cjmsN3FFkFwA
	tB3A5VLpf+CwQ8uA4XUzgI0hs8wvpkMvQeG7cMl4nTWpxDBeBEN7pKwUJ6a5O5K9kuwBFMFS4T0
	K21MN/2DXa4z+TkW9KV8soobG+QHBEDKTqJMA1zw2kk9RdQWpQtoMd+/7Hs8Gs3stniMv0lg8SF
	EmXopabYtzjfEda83V2EtkhNnfrAuPDEw5qHCNCx96OSIy6RJjFfzYyD4u28DbIynaSmf+7+sGm
	Doihp4Ald2ievoACouGx4CjWC3TI2xX1/SYGx02jSdboSEUpt6P3+CtVrJdBnOpvm2BWSkvGndo
	pN1l9XL94N82X9m53UKpz1F2Ar4hHMHGDonNN++1KtsU90fufyYaUAxCGPURkXFiNfW4meWR1x5
	2Xfw94WEQPn+pcwKkrAef6SuM7fpMOW5yKJJJ7jk7kRv3QdL+15mYAJ03uB+BzOPuBqEj4Jx1FE
	ZvZcks/3jC6AVbpHYhP3iAuA3BQfQYWzM0=
X-Received: by 2002:a05:620a:3708:b0:93f:d27:c89e with SMTP id
 af79cd13be357-9442175c185mr1940666385a.75.1793655360542; Mon, 02 Nov 2026
 13:36:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102090713.896324-1-pbrobinson@gmail.com> <20261102090713.896324-2-pbrobinson@gmail.com>
 <20261102-email-target-d3191584d234@spud> <CALeDE9Ncz=6jo_1VxdCJgSVV+fCTgkUvci-=e4MQYFYo_O9M0Q@mail.gmail.com>
 <5bd67c8d-41ee-40e7-ab75-031e1520758f@gmail.com>
In-Reply-To: <5bd67c8d-41ee-40e7-ab75-031e1520758f@gmail.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Mon, 2 Nov 2026 21:35:48 +0000
X-Gm-Features: AclHuK9c_iqft5lz_6jUeAVYzMiPhlLMeoYQ4TVGFVp9pkGtrtWvK0tM_qVXpc8
Message-ID: <CALeDE9NhPa3V4jJ-Lc1sOujdrSAtkOuoeLW98NBxUai2qZFoLw@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 and BCM2712
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_133602_012813_0BA13156 
X-CRM114-Status: GOOD (  29.98  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2 Nov 2026 at 20:38, Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 11/2/26 12:18, Peter Robinson wrote:
> > On Mon, 2 Nov 2026 at 19:39, Conor Dooley <conor@kernel.org> wrote:
> >>
> >> On Mon, Nov 02, 2026 at 09:06:51AM +0000, Peter Robinson wrote:
> >>> Add compatibles for the BCM2711 40-bit DMA4 channels, which are
> >>> described by a separate node covering channels 11-14, and for the
> >>> BCM2712 DMA controllers. The register address of a node identifies its
> >>> first channel, allowing a controller to be split across nodes.
> >>>
> >>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> >>> Cc: Rob Herring <robh@kernel.org>
> >>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> >>> Cc: Conor Dooley <conor+dt@kernel.org>
> >>>
> >>> ---
> >>>   .../bindings/dma/brcm,bcm2835-dma.yaml        | 31 +++++++++++++++++--
> >>>   1 file changed, 29 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> >>> index c9b9a5490826c..31d97a10a0ea9 100644
> >>> --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> >>> +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> >>> @@ -9,18 +9,27 @@ title: BCM2835 DMA controller
> >>>   maintainers:
> >>>     - Nicolas Saenz Julienne <nsaenz@kernel.org>
> >>>
> >>> -description:
> >>> +description: |
> >>>     The BCM2835 DMA controller has 16 channels in total. Only the lower
> >>>     13 channels have an associated IRQ. Some arbitrary channels are used by the
> >>>     VideoCore firmware (1,3,6,7 in the current firmware version). The channels
> >>>     0, 2 and 3 have special functionality and should not be used by the driver.
> >>>
> >>> +  BCM2711 channels 11 to 14 are 40-bit capable DMA4 channels, described by a
> >>> +  separate brcm,bcm2711-dma node. BCM2712 has 40-bit addressing on all
> >>> +  channels, with channels 6 to 11 being DMA4 channels. A controller may be
> >>> +  split across several nodes, the register address identifies the first
> >>> +  channel of a node.
> >>
> >> Uh no, a device should not be split across different nodes. This should
> >> not be needed, why can't your driver handle the upper channels having
> >> different capabilities?
> >
> > This is the way it's done in the downstream kernel, unfortunately
> > Broadcom doesn't publish the HW details so either they'd need to
> > contribute the support (which they've not done since the RPi4 was
> > available) or I'm not sure what the other options would be. Open to
> > suggestions.
>
> Neither here nor there, IMHO, yes it would be nice if documentation was
> published (and a customer like Raspberry Pi is probably one of the few
> that can get the needle to move there).
>
> You have the bcm2711 and bcm2712 compatible strings which should be
> enough for you to know which channels are 40-bit capable and which are
> not, yet keep the same Device Tree node.

From reading the downstream commits though it reads like the different
channels have different capabilities? Or am I reading that wrong and
it's the different generations of the HW that have different
capabilities?

Peter

