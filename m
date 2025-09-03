Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BAFCA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 02:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHjmanIcUbDp1eBa3yuGWLKN46L05l3A9F8rJ1gjMeE=; b=OTlXU3gxAqpnYa+9vISN21nMPQ
	nlv5zuheZYIrSevV0UBIDtHVVLs9YuINa6IMauuMzRa6w9OKLAtnN9eAwXnMbpTQ0WHHDZyUe9llP
	Fb5NdBALTAcmNl4K4iE2GPiLIIcum2HETcWvaXTxpBhdTf8W9tPsKVhUq3Im8SEmw7eErKJJScWou
	6WrV0IaLLd4nDt/hX73WbLl44yAhu/+NvGpKYk7OR+Rjl7qFiBWP2ZkhQ7ktc1a+jheW0GMLAUaqy
	kSHfFzztjZYCyMdhge0F+yQOTesqsqsNszLs/dxl3JCnkFsukObEB/yAJZErps8m75Gh/6aN3x4XF
	9RA8yDJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzR6-00000008FOd-3Yc4;
	Thu, 04 Sep 2025 02:10:52 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utvHx-00000007iMJ-3v7N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 21:45:11 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cHGNw69gDz9tGC;
	Wed,  3 Sep 2025 23:45:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756935904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZHjmanIcUbDp1eBa3yuGWLKN46L05l3A9F8rJ1gjMeE=;
	b=vkFm4xmiSkJrIIWfI+hF9v56JXlaziTisVgB/GlTG9jFBC7oXYCdea4poqo1uIryj3BT74
	U79gyfG7hok/ac/eq/BRraZ8UeKuV/XMKMORJSJL+g0NLYQH8yldjSscUF9QkETfU9MJa9
	bFSa0PiHK6+g5MXCF0Hsp9VITi2V3HQBOnGiUTvXc/rEnuG8F2WF/3Gc4MyN0QQo3PncKO
	Ajgt9o3MwWJFKwiTUz199kCI7h4mErrlSXaF9GmzsvjQaasZ7hMrVLiZBXZ8VUhjcozNp5
	H1zLA24J/zJewbbYpVxkRVv/n0b50Ar+yiHcSl9VEb45aX9LZWuIc35VlLIbEA==
Content-Type: multipart/mixed; boundary="------------RUV3G7hQJYDoa7JET1paPDuU"
Message-ID: <838a0c6b-845b-428d-86b3-1480e5b8080f@mailbox.org>
Date: Wed, 3 Sep 2025 23:44:59 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-5-marex@denx.de>
 <20250324094333.7afb17a1@collabora.com>
 <c1de2afb-3559-4fbb-b13b-2373175b420b@denx.de>
 <20250325084349.344a0f11@collabora.com>
 <7aadf355-edf0-46fc-b969-65c3789375ca@denx.de>
 <20250325153507.61d82e39@collabora.com>
 <4c06aef3-a254-437c-aa15-8e3eb7bf5951@denx.de>
 <20250325155231.0d1b1000@collabora.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250325155231.0d1b1000@collabora.com>
X-MBO-RS-ID: d51b669d6529346a39c
X-MBO-RS-META: u4q78zyf4fuepdgig3d9tbpa5hm16r61
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_144510_130264_B98043DC 
X-CRM114-Status: GOOD (  26.30  )
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

This is a multi-part message in MIME format.
--------------RUV3G7hQJYDoa7JET1paPDuU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/25 3:52 PM, Boris Brezillon wrote:

Hello Boris,

sorry for the late reply.

>>>>>>> Hm, that might be the cause of the fast reset issue (which is a fast
>>>>>>> resume more than a fast reset BTW): if you re-assert the reset line on
>>>>>>> runtime suspend, I guess this causes a full GPU reset, and the MCU ends
>>>>>>> up in a state where it needs a slow reset (all data sections reset to
>>>>>>> their initial state). Can you try to move the reset_control_[de]assert
>>>>>>> to the unplug/init functions?
>>>>>> Is it correct to assume , that if I remove all reset_control_assert()
>>>>>> calls (and keep only the _deassert() calls), the slow resume problem
>>>>>> should go away too ?
>>>>>
>>>>> Yeah, dropping the _assert()s should do the trick.
>>>> Hmmm, no, that does not help. I was hoping maybe NXP can chime in and
>>>> suggest something too ?
>>>
>>> Can you try keep all the clks/regulators/power-domains/... on after
>>> init, and see if the fast resume works with that. If it does,
>>> re-introduce one resource at a time to find out which one causes the
>>> MCU to lose its state.
>>
>> I already tried that too . I spent quite a while until I reached that L2
>> workaround in fact.
> 
> So, with your RPM suspend/resume being NOPs, it still doesn't work?
> Unless the FW is doing something behind our back, I don't really see
> why this would fail on your platform, but not on the rk3588. Are you
> sure the power domains are kept on at all times. I'm asking, because if
> you linked all the PDs, the on/off sequence is automatically handled by
> the RPM core at suspend/resume time.

I revisited this now.

Can you please test the following patch (also attached) on one of your 
devices, and tell me what the status is at the end . The diff sets the 
GLB_HALT bit and then clears it again, which I suspect should first halt 
the GPU and (this is what I am unsure about) then again un-halt/resume 
the GPU ?

"
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c 
b/drivers/gpu/drm/panthor/panthor_fw.c
index 9bf06e55eaeea..57c0d4fd29aa2 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1087,8 +1087,16 @@ void panthor_fw_pre_reset(struct panthor_device 
*ptdev, bool on_hang)
  		struct panthor_fw_global_iface *glb_iface = 
panthor_fw_get_glb_iface(ptdev);
  		u32 status;

+pr_err("%s[%d] pre-halt status=%x\n", __func__, __LINE__, 
gpu_read(ptdev, MCU_STATUS));
+
  		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
  		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
+mdelay(100);
+pr_err("%s[%d] likely-halted status=%x\n", __func__, __LINE__, 
gpu_read(ptdev, MCU_STATUS));
+		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
+mdelay(100);
+pr_err("%s[%d] likely-running ? status=%x\n", __func__, __LINE__, 
gpu_read(ptdev, MCU_STATUS));
+
  		if (!gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
  					   status == MCU_STATUS_HALT, 10,
  					   100000)) {
"

In my case, the relevant output looks like this:

"
[    3.326805] panthor_fw_pre_reset[1090] pre-halt status=1
[    3.432151] panthor_fw_pre_reset[1095] likely-halted status=2
[    3.542179] panthor_fw_pre_reset[1098] likely-running ? status=2
"

That means, the GPU remains halted at the end, even if the "GLB_HALT" 
bit is cleared before the last print. The clearing of GLB_HALT is also 
what panthor_fw_post_reset() does.

I suspect the extra soft reset I did before "un-halted" the GPU and 
allowed it to proceed.

I wonder if there is some way to un-halt the GPU using some gpu_write() 
direct register access, is there ? Maybe the GPU remains halted because 
setting the GLB_HALT stops command stream processing, and the GPU never 
samples the clearing of GLB_HALT and therefore remains halted forever ?
--------------RUV3G7hQJYDoa7JET1paPDuU
Content-Type: text/x-patch; charset=UTF-8; name="pan.diff"
Content-Disposition: attachment; filename="pan.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW50aG9yL3BhbnRob3JfZncuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9wYW50aG9yL3BhbnRob3JfZncuYwppbmRleCA5YmYwNmU1NWVhZWVh
Li41N2MwZDRmZDI5YWEyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFudGhvci9w
YW50aG9yX2Z3LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbnRob3IvcGFudGhvcl9mdy5j
CkBAIC0xMDg3LDggKzEwODcsMTYgQEAgdm9pZCBwYW50aG9yX2Z3X3ByZV9yZXNldChzdHJ1
Y3QgcGFudGhvcl9kZXZpY2UgKnB0ZGV2LCBib29sIG9uX2hhbmcpCiAJCXN0cnVjdCBwYW50
aG9yX2Z3X2dsb2JhbF9pZmFjZSAqZ2xiX2lmYWNlID0gcGFudGhvcl9md19nZXRfZ2xiX2lm
YWNlKHB0ZGV2KTsKIAkJdTMyIHN0YXR1czsKIAorcHJfZXJyKCIlc1slZF0gcHJlLWhhbHQg
c3RhdHVzPSV4XG4iLCBfX2Z1bmNfXywgX19MSU5FX18sIGdwdV9yZWFkKHB0ZGV2LCBNQ1Vf
U1RBVFVTKSk7CisKIAkJcGFudGhvcl9md191cGRhdGVfcmVxcyhnbGJfaWZhY2UsIHJlcSwg
R0xCX0hBTFQsIEdMQl9IQUxUKTsKIAkJZ3B1X3dyaXRlKHB0ZGV2LCBDU0ZfRE9PUkJFTEwo
Q1NGX0dMQl9ET09SQkVMTF9JRCksIDEpOworbWRlbGF5KDEwMCk7Citwcl9lcnIoIiVzWyVk
XSBsaWtlbHktaGFsdGVkIHN0YXR1cz0leFxuIiwgX19mdW5jX18sIF9fTElORV9fLCBncHVf
cmVhZChwdGRldiwgTUNVX1NUQVRVUykpOworCQlwYW50aG9yX2Z3X3VwZGF0ZV9yZXFzKGds
Yl9pZmFjZSwgcmVxLCAwLCBHTEJfSEFMVCk7CittZGVsYXkoMTAwKTsKK3ByX2VycigiJXNb
JWRdIGxpa2VseS1ydW5uaW5nID8gc3RhdHVzPSV4XG4iLCBfX2Z1bmNfXywgX19MSU5FX18s
IGdwdV9yZWFkKHB0ZGV2LCBNQ1VfU1RBVFVTKSk7CisKIAkJaWYgKCFncHVfcmVhZF9wb2xs
X3RpbWVvdXQocHRkZXYsIE1DVV9TVEFUVVMsIHN0YXR1cywKIAkJCQkJICAgc3RhdHVzID09
IE1DVV9TVEFUVVNfSEFMVCwgMTAsCiAJCQkJCSAgIDEwMDAwMCkpIHsK

--------------RUV3G7hQJYDoa7JET1paPDuU--

