Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BBCE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 08:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHnnUHp91IiQueQuFZsFH9XgulgL2ZrDddSYSfQGIo4=; b=df/zhf9ngdkpaJiKqmTYj4C/R4
	Y4G3qQd2Em0EHursis4GMOzVRVqYfHAto6heJk5q7HOS/8RHdEEJsqboL3MMgzTj49U+3EnlCSfe3
	ForpNTPzWKp5yau31ISju9HKsl/HDROtwzj/e0RZNm8PjTJ0bCECcFikb4O5hrPcbAhCMCFiXEWm4
	Wap/3Py6XStIIsw5tu8p4jv/AgO4rBn4mBZ6KFSwxAE9p4ps59cBiPQ3fr1xlyuzUbCiNCJpDPln1
	GQvKnapDfbFyRBAE0W0YJaVbhZQ6AeMbArIhq55cl2Y8wDpAZzynerrFcpZcuoCNtRMiF1fKuDJig
	o0Dvdc6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR5Uq-0000000HLXK-1ZUa;
	Fri, 27 Dec 2024 08:15:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR5Te-0000000HLPK-45NK;
	Fri, 27 Dec 2024 08:13:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3BF15A41266;
	Fri, 27 Dec 2024 08:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE239C4CED0;
	Fri, 27 Dec 2024 08:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735287225;
	bh=96Hwn3Z+nB6AngNQ+jC51nXEuFyFhKWFheg0DPO7DX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F2ikearVIQGXVk7OUw6RZwnS3Un4zq4CnVNru13sDprPSxlmuJslono3QqU53AzIi
	 iPjyUJQTbTlmqcKxYccWA9sz59f6kTxUWr1U5scoZCYgdQnIC8oyOQ/kLxMIHbxdGe
	 Z2CYFJIys6HMhituaJUmBjsaqOj6CA43ciltrxZvFTzycx4SuJoAPSU/c+JiQ3h8da
	 w6ZteDNJLbKk49ijJuslQwdm9g3tA5U/kx1Kf4mMD1LFK1j6VS0wvUcySQh0Foi31K
	 XD9uAdac2+VkvcLqiqvXCp3mxgOlIRvo8xZm6MIyni7mnLC5eYO3opPXrgF/LxA+pi
	 u0WEtVsS19kIQ==
Date: Fri, 27 Dec 2024 09:13:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, 
	Xavier Chang <xavier.chang@mediatek.com>, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 1/7] dt-bindings: mailbox: mediatek: Add MT8196
 support for gce-mailbox
Message-ID: <yg7b2iaz53avd7gpvuewhi6b3myh6owls3dt2hzpqc26lnykjf@tpu2vxqqkipe>
References: <20241219170800.2957-1-jason-jh.lin@mediatek.com>
 <20241219170800.2957-2-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241219170800.2957-2-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_001347_073688_C0527EAB 
X-CRM114-Status: GOOD (  16.84  )
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

On Fri, Dec 20, 2024 at 01:07:54AM +0800, Jason-JH.Lin wrote:
>    2) GCE Subsys ID:
>    - Defined in the header file: `#define SUBSYS_1c00XXXX 3`
>    - Used in the Device Tree:
>    	`mediatek,gce-client-reg = <&gce SUBSYS_1c00XXXX 0x0000 0x1000>;`
>    - Parsed and used in the driver to configure subsys ID:
>      ```c
>      int cmdq_dev_get_client_reg(struct device *dev,
>      				 struct cmdq_client_reg *client_reg,
>      				 int idx)
>      {
>      	client_reg->subsys = (u8)spec.args[0];
>      	client_reg->offset = (u16)spec.args[1];
>      }
>      // GCE write the value to the register 0x1c000000 + 0x0000 + offset
>      cmdq_pkt_write(cmdq_handle, client_reg->subsys,
>      		    client_reg->offset + offset, value);

This is a proof that SUBSYS_1300XXXX is not a binding. Your driver does
not use it.

Drop all such things which are not used by drivers or explain why they
are needed to be in the binding - what do they bind.

I asked for this already, for exactly the same thing.


I did not check the rest, so next time I will choose any other random
define and if I do not find it explained nor used, I will question it.
Because you tend to apply pieces of review instead of really change your
code.

>      ```

Best regards,
Krzysztof


